Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E4D2A91A9AA
	for <lists+linux-aspeed@lfdr.de>; Thu, 27 Jun 2024 16:49:05 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=UZ9QjJY2;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W91fc5KqFz3cYm
	for <lists+linux-aspeed@lfdr.de>; Fri, 28 Jun 2024 00:48:56 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=UZ9QjJY2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W91fV6c6Mz3cWW
	for <linux-aspeed@lists.ozlabs.org>; Fri, 28 Jun 2024 00:48:50 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4D68261EC0;
	Thu, 27 Jun 2024 14:48:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0F2FC2BBFC;
	Thu, 27 Jun 2024 14:48:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719499729;
	bh=d8LbeMrXrnMpFcQld1fOek1N8Ag6qgXMrlSDVv0fOsQ=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=UZ9QjJY26Q6BUnNdFz/EQvNr44kfvbyZqopalZ5LEWXrUykasUFhm6ooxqHC64iJd
	 1fisXuT/ZmKLKUrSuCCEb+CcixBy3ce3eHkO6EJipIPFeHbXb4CjDXMBJWpAJoY7BE
	 63SXgkCp1cyi+5EROFfBvEwxNRMvXpU4bSbZqdGVPFEMzIECpB+mOmSMoerW16IQPT
	 bZ7V+c8+mX7CDEm1Ss8Cf6a/Lm5TQprByolMrAb60N7nBs8E+mo+FTnu2w2zODqQU9
	 oTXWiu8SFJAwJVth3KOiM9drTaOethNl/tYVIX8Im8G8+rbZjDlB/16pP9JMtPo6tD
	 cz50r3MP26lBg==
Date: Thu, 27 Jun 2024 08:48:47 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Peter Yin <peteryin.openbmc@gmail.com>
In-Reply-To: <20240627070013.2509150-1-peteryin.openbmc@gmail.com>
References: <20240627070013.2509150-1-peteryin.openbmc@gmail.com>
Message-Id: <171949936638.3312359.3954253966631367606.robh@kernel.org>
Subject: Re: [PATCH v2 00/10] Revise Meta(Facebook) Harma BMC(AST2600)
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, patrick@stwcx.xyz, amithash@meta.com, Krzysztof Kozlowski <krzk+dt@kernel.org>, Andrew Jeffery <andrew@codeconstruct.com.au>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>


On Thu, 27 Jun 2024 15:00:02 +0800, Peter Yin wrote:
> Summary:
> Revise linux device tree entry related to Meta(Facebook) Harma
> specific devices connected to BMC(AST2600) SoC.
> 
> Base on: https://lore.kernel.org/all/CAPSyxFRj0twCJG6Lr5UZpznrUHyd_L0Reo=kZSFwCw3FNQ+x+A@mail.gmail.com/
> 
> Change log:
> 
> v1 -> v2
>   - Patch 0007  - add fru device
>   - Patch 0008  - add temperature device
>   - Patch 0009  - enable mctp controller
>   - Patch 00010 - fixed dtb_check warning
> 
> v1
>   - Patch 0001 - revise hsc chip
>   - Patch 0002 - add VR device
>   - Patch 0003 - add sgpio name
>   - Patch 0004 - add ina238
>   - Patch 0005 - add power monitor xdp710
>   - Patch 0006 - remove multi-host property
>   - Patch 0007 - remove pca9546
> 
> Peter Yin (10):
>   ARM: dts: aspeed: Harma: revise hsc chip
>   ARM: dts: aspeed: Harma: add VR device
>   ARM: dts: aspeed: Harma: add sgpio name
>   ARM: dts: aspeed: Harma: add ina238
>   ARM: dts: aspeed: Harma: add power monitor xdp710
>   ARM: dts: aspeed: Harma: remove multi-host property
>   ARM: dts: aspeed: Harma: add fru device
>   ARM: dts: aspeed: Harma: add temperature device
>   ARM: dts: aspeed: Harma: enable mctp controller
>   ARM: dts: aspeed: Harma: fixed dtb_check warning
> 
>  .../dts/aspeed/aspeed-bmc-facebook-harma.dts  | 146 ++++++++++++++++--
>  1 file changed, 132 insertions(+), 14 deletions(-)
> 
> --
> 2.25.1
> 
> 
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


New warnings running 'make CHECK_DTBS=y aspeed/aspeed-bmc-facebook-harma.dtb' for 20240627070013.2509150-1-peteryin.openbmc@gmail.com:

arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dtb: ftgmac@1e690000: Unevaluated properties are not allowed ('#address-cells', '#size-cells' were unexpected)
	from schema $id: http://devicetree.org/schemas/net/faraday,ftgmac100.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dtb: /ahb/apb/bus@1e78a000/i2c@700/i2c-mux@70/i2c@0/power-monitor@61: failed to match any schema with compatible: ['isil,isl69260']
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dtb: /ahb/apb/bus@1e78a000/i2c@700/i2c-mux@70/i2c@0/power-monitor@62: failed to match any schema with compatible: ['isil,isl69260']
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dtb: /ahb/apb/bus@1e78a000/i2c@700/i2c-mux@70/i2c@0/power-monitor@63: failed to match any schema with compatible: ['isil,isl69260']





