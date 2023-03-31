Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 49BD76D1BB2
	for <lists+linux-aspeed@lfdr.de>; Fri, 31 Mar 2023 11:15:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PnvlJ0r5Bz3fRC
	for <lists+linux-aspeed@lfdr.de>; Fri, 31 Mar 2023 20:15:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=f+RTY1E3;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=jk@codeconstruct.com.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=f+RTY1E3;
	dkim-atps=neutral
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pnvl81WDHz3cBK
	for <linux-aspeed@lists.ozlabs.org>; Fri, 31 Mar 2023 20:15:15 +1100 (AEDT)
Received: by codeconstruct.com.au (Postfix, from userid 10000)
	id D189F20156; Fri, 31 Mar 2023 17:15:13 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1680254113;
	bh=V7VKEyDxEI8ZR8KoaP19Mi+G8YmO8XIsRnHDacm64Hk=;
	h=From:To:Cc:Subject:Date;
	b=f+RTY1E3vF89NURR2dU4/QVmDCdXUGRLzO8j9mEXZd2FHMuwn3dZm3VLen37zNR1g
	 Gfj/orZewDfOJot6Ge6C1NQCtHVqOdC8fEVf6wvLbvaQQLEyg9Z9U/taXOJ87mwGEN
	 iqen0pFTjKGb0Lz5g5fsttDWYln+XdOL84zGHWczsqjl/dMSmNiV6gPCa+roZoF2Dd
	 akelWg3oK+UjZOhc84dr55VOTRRSLsstLzn6tvA5ES5q/CGzhxo5LiDvkMeWRkkz11
	 z7WtyGMvy59CoX4dehEQ6QZ+OAinBDSfcFltX2gsvPxaEfoLvYpIosoXBuK35izM1F
	 tZzAVT7tR8yyA==
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: linux-i3c@lists.infradead.org
Subject: [PATCH v3 0/3] i3c dw,ast2600: Add a driver for the AST2600 i3c controller
Date: Fri, 31 Mar 2023 17:14:58 +0800
Message-Id: <20230331091501.3800299-1-jk@codeconstruct.com.au>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Vitor Soares <ivitro@gmail.com>, devicetree@vger.kernel.org, Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-aspeed@lists.ozlabs.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matt Johnston <matt@codeconstruct.com.au>, Jack Chen <zenghuchen@google.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

This series adds a new i3c controller driver, for the ASPEED AST2600 i3c
SoC peripheral. This device is very similar to the dw i3c controller, so
we implement this by adding a little platform abstraction to the dw
driver, and then a platform implementation for ast2600.

For those testing at home: there's a couple of prereqs for getting this
running: we need the ast2600 i3c clocks in their proper configuration,
as implemented in:

  https://lore.kernel.org/all/20230302005834.13171-1-jk@codeconstruct.com.au/

- this series has been merged to clk-next, but has not hit Linus'
upstream yet. The series will still build fine without this.

You'll also want the dts definitions for the i3c controller and
pincontrol setup on the ast2600 platform. I have changes for those in my
dev/i3c branch:

  https://github.com/CodeConstruct/linux/commits/dev/i3c

- and will send those once we have the driver accepted.

v3: expand the prereqs & background above, and implement some feedback
from review. Mainly: rather that using a platform_data pointer, assume
platforms will use an encapsulating struct for their platform-specific
data

v2: This is a rework from an earlier series that implemented this as
part of the dw driver; I have adopted Ben Dooks' suggestion to split
into a new driver + exported hooks from the dw base.

As always: comments, queries etc. are most welcome.

Cheers,


Jeremy

Jeremy Kerr (3):
  i3c: dw: Add infrastructure for platform-specific implementations
  dt-bindings: i3c: Add AST2600 i3c controller
  i3c: ast2600: Add AST2600 platform-specific driver

 .../bindings/i3c/aspeed,ast2600-i3c.yaml      |  72 ++++++++
 MAINTAINERS                                   |   6 +
 drivers/i3c/master/Kconfig                    |  14 ++
 drivers/i3c/master/Makefile                   |   1 +
 drivers/i3c/master/ast2600-i3c-master.c       | 168 ++++++++++++++++++
 drivers/i3c/master/dw-i3c-master.c            |  76 ++++----
 drivers/i3c/master/dw-i3c-master.h            |  54 ++++++
 7 files changed, 358 insertions(+), 33 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/i3c/aspeed,ast2600-i3c.yaml
 create mode 100644 drivers/i3c/master/ast2600-i3c-master.c
 create mode 100644 drivers/i3c/master/dw-i3c-master.h

-- 
2.39.1

