import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:super_fitness/core/di/di.dart';
import 'package:super_fitness/features/auth/presentation/pages/logout_view.dart';
import 'package:super_fitness/features/profile/presentation/cubit/profile_states.dart';
import 'package:super_fitness/features/profile/presentation/cubit/profile_view_model.dart';

import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/routes_manager.dart';
import '../../../../core/utils/cashed_data_shared_preferences.dart';
import '../../../../core/utils/utilss.dart';
import '../../../../core/widgets/show_error_dialog.dart';
import '../../../edit_profile/presentation/pages/edite_profile_view.dart';
import '../widgets/profile_item.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  late ProfileViewModel viewModel;

  bool isSwitched = false;

  @override
  void initState() {
    viewModel = getIt.get<ProfileViewModel>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel
        ..getProfileData(
            "Bearer ${CacheService.getData(key: CacheConstants.userToken)}"),
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage("assets/images/profile_photo.png")),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: BlocBuilder<ProfileViewModel, ProfileStates>(
                  builder: (context, state) {
                if (state is LoadingProfileState) {
                  return Center(child: CircularProgressIndicator(color: ColorManager.orange,));
                } else if (state is SuccessProfileState) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 40,
                      ),
                      Row(
                        children: [
                          InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Image.asset("assets/images/Back.png")),
                          SizedBox(
                            width: 130,
                          ),
                          Text(
                            AppLocalizations.of(context)!.profile,
                            style: GoogleFonts.balooThambi2(
                                fontWeight: FontWeight.w600,
                                fontSize: 24,
                                color: Colors.white),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: NetworkImage(
                                  '${state.profileResponseEntity.user!.photo}'),
                            )),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        "${state.profileResponseEntity.user!.firstName}  ${state.profileResponseEntity.user!.lastName}",
                        style: GoogleFonts.balooThambi2(
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                            color: Colors.white),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Container(
                        padding: EdgeInsets.only(),
                        decoration: BoxDecoration(
                          color: ColorManager.primary.withOpacity(0.9),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              GestureDetector(


                                onTap:(){
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => EditeProfileView(profileViewModel: viewModel,)));
                                 // Navigator.pushNamed(context, RoutesManager.editeProfileView);
                                },
                                child: ProfileItem(
                                  imagePath: "assets/images/pofile_icon.png",
                                  icon: Icon(
                                    Icons.navigate_next,
                                    size: 24,
                                    color: ColorManager.mainColor,
                                  ),
                                  tittle:
                                      AppLocalizations.of(context)!.editProfile,
                                ),
                              ),
                              ProfileItem(
                                imagePath: "assets/images/password_icon.png",
                                icon: Icon(
                                  Icons.navigate_next,
                                  size: 24,
                                  color: ColorManager.mainColor,
                                ),
                                tittle: AppLocalizations.of(context)!
                                    .changePassword,
                              ),
                              Row(
                                children: [
                                  Image.asset(
                                    "assets/images/lang_icon.png",
                                    height: 20,
                                    width: 20,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 16),
                                    child: Text(
                                      '${AppLocalizations.of(context)!.selectLang} (',
                                      style: GoogleFonts.balooThambi2(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14,
                                          color: Colors.white),
                                    ),
                                  ),
                                  Text(
                                    'English',
                                    style: GoogleFonts.balooThambi2(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14,
                                        color: ColorManager.mainColor),
                                  ),
                                  Text(
                                    ')',
                                    style: GoogleFonts.balooThambi2(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14,
                                        color: ColorManager.white),
                                  ),
                                  Spacer(),
                                  Switch(
                                    value: isSwitched,
                                    onChanged: (value) {
                                      setState(() {
                                        isSwitched = value;
                                      });
                                    },
                                    activeColor: ColorManager.white,
                                    activeTrackColor: ColorManager.mainColor,
                                    // Background when ON
                                    inactiveThumbColor: Colors.white,
                                    inactiveTrackColor: Colors.grey, //
                                  ),
                                ],
                              ),
                              Divider(
                                color: ColorManager.fieldTextBorder
                                    .withOpacity(0.05),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              ProfileItem(
                                imagePath: "assets/images/lock_icon.png",
                                icon: InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, RoutesManager.securityView);
                                  },
                                  child: Icon(
                                    Icons.navigate_next,
                                    size: 24,
                                    color: ColorManager.mainColor,
                                  ),
                                ),
                                tittle: AppLocalizations.of(context)!.security,
                              ),
                              ProfileItem(
                                imagePath: "assets/images/privay_icon.png",
                                icon: InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, RoutesManager.privacyView);
                                  },
                                  child: Icon(
                                    Icons.navigate_next,
                                    size: 24,
                                    color: ColorManager.mainColor,
                                  ),
                                ),
                                tittle:
                                    AppLocalizations.of(context)!.privacyPolicy,
                              ),
                              ProfileItem(
                                imagePath: "assets/images/help_icon.png",
                                icon: InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, RoutesManager.helpView);
                                  },
                                  child: Icon(
                                    Icons.navigate_next,
                                    size: 24,
                                    color: ColorManager.mainColor,
                                  ),
                                ),
                                tittle: AppLocalizations.of(context)!.help,
                              ),
                              Row(
                                children: [
                                  Image.asset(
                                    "assets/images/logout_icon.png",
                                    height: 20,
                                    width: 20,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 16),
                                    child: Text(
                                      AppLocalizations.of(context)!.logout,
                                      style: GoogleFonts.balooThambi2(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14,
                                          color: ColorManager.mainColor),
                                    ),
                                  ),
                                  Spacer(),
                                  InkWell(
                                    onTap: (){
                                      showDialog(context: context, builder: (context) => LogoutConfirmationDialogue(),);
                                     // Navigator.pushNamed(context,RoutesManager.logOutScreen);
                                    },
                                    child: Icon(
                                      Icons.navigate_next,
                                      size: 24,
                                      color: ColorManager.mainColor,
                                    ),
                                  ),
                                ],
                              ),
                              Divider(
                                color: ColorManager.fieldTextBorder
                                    .withOpacity(0.05),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                } else if (state is ErrorProfileState) {
                  var message = extractErrorMessage(state.exception);
                  showErrorDialog(context, message);
                  return Text("Something went wrong");
                }
                return SizedBox();
              })),
        ),
      ),
    );
  }
}
