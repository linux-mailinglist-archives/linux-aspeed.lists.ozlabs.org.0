Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CC076861351
	for <lists+linux-aspeed@lfdr.de>; Fri, 23 Feb 2024 14:51:45 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=rBbq6jL2;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ThBJC3X1qz3vX6
	for <lists+linux-aspeed@lfdr.de>; Sat, 24 Feb 2024 00:51:39 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=rBbq6jL2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ThBJ21PW8z3cb5
	for <linux-aspeed@lists.ozlabs.org>; Sat, 24 Feb 2024 00:51:30 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id F395C634CA;
	Fri, 23 Feb 2024 13:51:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 936E7C433F1;
	Fri, 23 Feb 2024 13:51:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708696286;
	bh=mhwjRRk4xV74kVMVwbQeUgkmSwWD2N6U/AIZ0aFPLoc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rBbq6jL2OsqWVIKa7CksYk2uhXPZGdHxBn/0ltvJIlaVANWeQ2zCwKbKhDY+seSri
	 18pkaS/Qor++1WTn4g8FD3gO6Hn+QwWZtpIK34Yvi5cxrBdSdF45A/ga6KY3KfjI+P
	 EiZY93ZbjnStqdyyWjZ60UDQweHJaptMMzFjNPsaGV/NipHSJwnh1xrrFRNqbA1QYk
	 oW/jyTVht1JyFIjC4Iqua6wS80DVXepnZ0b/ABzfSn6oEmSOjxt5MrSbhPHwV900+9
	 Rlxau8L98D/kxv/Hk+D/JvpxKWS46zSgBkTiFqzr/unwNk6nvjnfQ5TfWa1OBg53V7
	 5VGxlrPbIlg1g==
Date: Fri, 23 Feb 2024 06:51:24 -0700
From: Rob Herring <robh@kernel.org>
To: Billy Tsai <billy_tsai@aspeedtech.com>
Subject: Re: [PATCH v14 2/3] dt-bindings: hwmon: Support Aspeed g6 PWM TACH
 Control
Message-ID: <170869628286.1766501.17404664389550900332.robh@kernel.org>
References: <20240221104025.1306227-1-billy_tsai@aspeedtech.com>
 <20240221104025.1306227-3-billy_tsai@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240221104025.1306227-3-billy_tsai@aspeedtech.com>
X-BeenThere: linux-aspeed@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux ASPEED SoC development <linux-aspeed.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linux-aspeed>,
 <mailto:linux-aspeed-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linux-aspeed/>
List-Post: <mailto:linux-aspeed@lists.ozlabs.org>
List-Help: <mailto:linux-aspeed-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linux-aspeed>,
 <mailto:linux-aspeed-request@lists.ozlabs.org?subject=subscribe>
Cc: linux-hwmon@vger.kernel.org, BMC-SW@aspeedtech.com, conor+dt@kernel.org, jdelvare@suse.com, krzysztof.kozlowski+dt@linaro.org, linux-aspeed@lists.ozlabs.org, linux-doc@vger.kernel.org, corbet@lwn.net, linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org, naresh.solanki@9elements.com, patrick@stwcx.xyz, devicetree@vger.kernel.org, robh+dt@kernel.org, linux@roeck-us.net, p.zabel@pengutronix.de, u.kleine-koenig@pengutronix.de, andrew@codeconstruct.com.au, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>


On Wed, 21 Feb 2024 18:40:24 +0800, Billy Tsai wrote:
> Document the compatible for aspeed,ast2600-pwm-tach device, which can
> support up to 16 PWM outputs and 16 fan tach input.
> 
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
> ---
>  .../bindings/hwmon/aspeed,g6-pwm-tach.yaml    | 71 +++++++++++++++++++
>  1 file changed, 71 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/aspeed,g6-pwm-tach.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

