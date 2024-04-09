Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BB6289DA77
	for <lists+linux-aspeed@lfdr.de>; Tue,  9 Apr 2024 15:38:56 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=DmEoXxg3;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VDRrD3bXhz3dXg
	for <lists+linux-aspeed@lfdr.de>; Tue,  9 Apr 2024 23:38:52 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=DmEoXxg3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VDRr14z95z3dRY
	for <linux-aspeed@lists.ozlabs.org>; Tue,  9 Apr 2024 23:38:41 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id E47ACCE1F2F;
	Tue,  9 Apr 2024 13:38:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 607A2C433F1;
	Tue,  9 Apr 2024 13:38:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712669918;
	bh=LH2+MZ60zszRAlWofS4xHZNyYvkyDt5kHRdPGDl7eDg=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=DmEoXxg3vjS6lYG2wOO/DN1hcJODw5Bzq6hdl5Q5Jq1SCYm2nv5cwXaS3A9AnKoD8
	 MVgZeFAhmLUd9aVnxZOL1Ya3BXj1wZB0fsQwZQFG6jq82HS6W4eIm2AkW8to9cddY/
	 6dvcmCrFWoAxAssNCjB7WUPy4fAc9Wjnm6tQYjP59TgD5UHXLhmWVs03WPDznLa+SK
	 YwTEYeRaippOoG0aIEEUViHWUJM99iWa7Ga4l/6pWqcFHSOHJhnyrXIZ6OG/0k45Zj
	 qH0HencCnuol3TUHj+LoZgeGvz6YZ8qhCZFsCchIvKUBj+/V60gaS97SVkQVuy8cDx
	 75JwJ1ScmB5Lw==
Date: Tue, 09 Apr 2024 08:38:37 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20240405064624.18997-1-krzysztof.kozlowski@linaro.org>
References: <20240405064624.18997-1-krzysztof.kozlowski@linaro.org>
Message-Id: <171266958251.1032405.3082451019333889181.robh@kernel.org>
Subject: Re: [PATCH v2 1/5] ARM: dts: aspeed: greatlakes: correct Mellanox
 multi-host property
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, Andrew Jeffery <andrew@codeconstruct.com.au>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>


On Fri, 05 Apr 2024 08:46:20 +0200, Krzysztof Kozlowski wrote:
> "mlx,multi-host" is using incorrect vendor prefix and is not documented.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Changes in v2:
> 1. None
> ---
>  arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-greatlakes.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


New warnings running 'make CHECK_DTBS=y aspeed/aspeed-bmc-ampere-mtmitchell.dtb aspeed/aspeed-bmc-facebook-greatlakes.dtb aspeed/aspeed-bmc-facebook-harma.dtb aspeed/aspeed-bmc-facebook-yosemite4.dtb aspeed/aspeed-bmc-facebook-yosemitev2.dtb' for 20240405064624.18997-1-krzysztof.kozlowski@linaro.org:

arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dtb: ftgmac@1e690000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'mellanox,multi-host' were unexpected)
	from schema $id: http://devicetree.org/schemas/net/faraday,ftgmac100.yaml#





