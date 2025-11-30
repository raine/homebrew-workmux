class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.33"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.33/aarch64-apple-darwin.tar.gz"
      sha256 "2eb3e031fe16cc0e7286e3fc559f8fa0700f9eca18c3971e0ec88a333d541b5f"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.33/x86_64-apple-darwin.tar.gz"
      sha256 "c95670a8e21d0659355bfbba1515217ddf8bf9c4caf6293f71dcd76a2d9e088a"
    end
  end

  on_linux do
    url "https://github.com/raine/workmux/releases/download/v0.1.33/x86_64-unknown-linux-gnu.tar.gz"
    sha256 "748beb740685bee267b0ea05b61a03a9eafaef0d959f7588cad77e63f8b98557"
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
