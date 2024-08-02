Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 388389456FE
	for <lists+linux-aspeed@lfdr.de>; Fri,  2 Aug 2024 06:26:23 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=XTzwrr3J;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WZt7d05r1z3dSp
	for <lists+linux-aspeed@lfdr.de>; Fri,  2 Aug 2024 14:26:21 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=XTzwrr3J;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WZt7K1bXqz3cTj
	for <linux-aspeed@lists.ozlabs.org>; Fri,  2 Aug 2024 14:26:04 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1722572762;
	bh=zOz6JpiahHTKjU39EjbGDoJvjEGQPwoBp3gU7ztZvHE=;
	h=From:Subject:Date:To:Cc;
	b=XTzwrr3JXHrpV90rv9mqQnOvJhUgUkMIoxq95Qzu95jrIqGuaqHJMd+rfPn3WKH84
	 NAJd7CCVuNc2hXm+80BD7Y+GAY7+Qal0AxYR+iLERV5nfRErbLiVfF8FgFbkGG9fue
	 woAEvuco9LIw+rMwIo8KgxCLTOm5YxX/dD7Ro1ce3VJ+AhpBDE886GWgTAxJlfNK/S
	 cToYvo2FzjE+pQScyIk1f0c6RKJJ+dBWtjU996wvWAByKwkizOt+Bjh5wokTq6J4U9
	 TJdfTgcXNR+5eSTwfkPCn069ocolONEDROExlBpCaCey1HNGMAixcM2q8DA1f90QF0
	 73jE7UTUTVazw==
Received: from [127.0.1.1] (ppp118-210-29-70.adl-adc-lon-bras31.tpg.internode.on.net [118.210.29.70])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 8B72765665;
	Fri,  2 Aug 2024 12:26:00 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH 0/7] ARM: dts: aspeed: Miscellaneous devicetree cleanups
Date: Fri, 02 Aug 2024 13:55:17 +0930
Message-Id: <20240802-dt-warnings-bmc-dts-cleanups-v1-0-1cb1378e5fcd@codeconstruct.com.au>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAK1frGYC/x3MwQqDMAwA0F+RnBeoZVjdr8gObc1qwEVp1Aniv
 1t2fJd3glJmUnhVJ2TaWXmWgvpRQRy9JEIeisEa+zStsTis+PNZWJJi+MZixTiRl21RpCY0LnT
 emtpBKZZMHz7+ff++rhuMRX+fbgAAAA==
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Eddie James <eajames@linux.ibm.com>
X-Mailer: b4 0.14.1
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hello,

As mentioned elsewhere the Aspeed devicetrees are in a bit of a sad
state. This series is a collection of fixes that make them a little
less so.

If there no concerns raised in the near future I'll queue them up for
the BMC tree.

Andrew

---
Andrew Jeffery (7):
      ARM: dts: aspeed: Fix coprocessor interrupt controller node name
      ARM: dts: aspeed: Specify correct generic compatible for CVIC
      ARM: dts: aspeed: Specify required properties for sram node
      ARM: dts: aspeed: Remove undocumented XDMA nodes
      ARM: dts: aspeed: Clean up AST2500 pinctrl properties
      ARM: dts: aspeed-g6: Use generic 'ethernet' for ftgmac100 nodes
      ARM: dts: aspeed-g6: Drop cells properties from ethernet nodes

 .../boot/dts/aspeed/aspeed-bmc-ampere-mtjade.dts   |  4 ---
 .../aspeed/aspeed-bmc-arm-stardragon4800-rep2.dts  |  4 ---
 .../boot/dts/aspeed/aspeed-bmc-asrock-x570d4u.dts  |  4 ---
 .../arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dts |  5 ----
 .../arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dts |  5 ----
 .../arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dts |  5 ----
 .../boot/dts/aspeed/aspeed-bmc-inspur-fp5280g2.dts |  4 ---
 .../boot/dts/aspeed/aspeed-bmc-inspur-on5263m5.dts |  4 ---
 .../boot/dts/aspeed/aspeed-bmc-intel-s2600wf.dts   |  4 ---
 .../arm/boot/dts/aspeed/aspeed-bmc-opp-lanyang.dts |  4 ---
 arch/arm/boot/dts/aspeed/aspeed-bmc-opp-nicole.dts |  4 ---
 .../arm/boot/dts/aspeed/aspeed-bmc-opp-romulus.dts |  4 ---
 arch/arm/boot/dts/aspeed/aspeed-bmc-opp-swift.dts  |  4 ---
 arch/arm/boot/dts/aspeed/aspeed-bmc-opp-tacoma.dts |  5 ----
 .../boot/dts/aspeed/aspeed-bmc-opp-witherspoon.dts |  9 -------
 arch/arm/boot/dts/aspeed/aspeed-bmc-opp-zaius.dts  |  2 --
 .../dts/aspeed/aspeed-bmc-supermicro-x11spi.dts    |  4 ---
 arch/arm/boot/dts/aspeed/aspeed-g4.dtsi            |  7 ++++--
 arch/arm/boot/dts/aspeed/aspeed-g5.dtsi            | 18 ++++----------
 arch/arm/boot/dts/aspeed/aspeed-g6.dtsi            | 29 +++-------------------
 20 files changed, 14 insertions(+), 115 deletions(-)
---
base-commit: 8400291e289ee6b2bf9779ff1c83a291501f017b
change-id: 20240802-dt-warnings-bmc-dts-cleanups-e6b67b9a2017

Best regards,
-- 
Andrew Jeffery <andrew@codeconstruct.com.au>

