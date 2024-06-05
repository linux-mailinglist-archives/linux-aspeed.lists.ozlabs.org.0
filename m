Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DC3C78FCE97
	for <lists+linux-aspeed@lfdr.de>; Wed,  5 Jun 2024 15:12:10 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=AxCXSDuI;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VvSY370yHz30W2
	for <lists+linux-aspeed@lfdr.de>; Wed,  5 Jun 2024 23:12:07 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=AxCXSDuI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VvSXV3z8Gz3cMQ
	for <linux-aspeed@lists.ozlabs.org>; Wed,  5 Jun 2024 23:11:38 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 7C5FBCE17D4;
	Wed,  5 Jun 2024 13:11:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2E70C3277B;
	Wed,  5 Jun 2024 13:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717593094;
	bh=p1Mf5DG1LhyqB8wXqkjnzUXqy6sag24Z+F1LZfH0pEQ=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=AxCXSDuIbI9ABphc+MtPB9Swb+NEhUSK4Setoo6PWjDy2kz9THhj9T83HAtduj5zD
	 zCb7UnP/FU46eA80JDJX5jkXO+nn4E+Bx5gFgXIi773vzBj0Q4uwRDSa39NAcb4zcA
	 WuItGcB2a/CHQtIBreJsKho8GZV4Yu04JhhDzudISPRA2Z8BU2Kj0nAJ3X5GuWQhRa
	 RzeMIxE5DmeFsvAh8g8wMpuQ9WbXCdJQDiv7ooeaQcSt91KfgSNxHbo4RNgi3Y+ArJ
	 s+KEhHh4FIk/bEH++xMbh04Xy9iR/Ex2/0jNnHfbjehFDxgsAtwNOrmYN0WAVf8gHv
	 qJ3E5DTkPFSUw==
Date: Wed, 05 Jun 2024 07:11:32 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Ninad Palsule <ninad@linux.ibm.com>
In-Reply-To: <20240604215939.1967329-1-ninad@linux.ibm.com>
References: <20240604215939.1967329-1-ninad@linux.ibm.com>
Message-Id: <171759284804.2200781.9915039390039475490.robh@kernel.org>
Subject: Re: [PATCH v1] ARM: dts: aspeed: System1: Updates to BMC board
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, krzk+dt@kernel.org, andrew@codeconstruct.com.au, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>


On Tue, 04 Jun 2024 16:59:39 -0500, Ninad Palsule wrote:
> - Added new power monitor device max5970
> - Changed temperature sensor monitor chip from tmp423 to tmp432
> 
> Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
> ---
>  arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
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


New warnings running 'make CHECK_DTBS=y aspeed/aspeed-bmc-ibm-system1.dtb' for 20240604215939.1967329-1-ninad@linux.ibm.com:

arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dtb: power-monitor@3a: 'regulators' is a required property
	from schema $id: http://devicetree.org/schemas/mfd/maxim,max5970.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dtb: power-monitor@3a: 'vss1-supply' is a required property
	from schema $id: http://devicetree.org/schemas/mfd/maxim,max5970.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dtb: power-monitor@3a: 'vss2-supply' is a required property
	from schema $id: http://devicetree.org/schemas/mfd/maxim,max5970.yaml#





