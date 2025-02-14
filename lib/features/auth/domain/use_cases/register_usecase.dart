import 'package:injectable/injectable.dart';
import 'package:super_fitness/core/common/api_result.dart';
import 'package:super_fitness/features/auth/data/models/register_models/register_request.dart';
import '../entities/register_entities.dart';
import '../repositories/register_repo.dart';

@injectable
class RegisterUseCase {
   RegisterRepo registerRepository;

  RegisterUseCase(this.registerRepository);

  Future<Result<RegisterEntity?>> register(
      RegisterModelRequest registerModelRequest) async {
    return await registerRepository.register(registerModelRequest);
  }
}
