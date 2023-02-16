Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FE06698DEE
	for <lists+linux-aspeed@lfdr.de>; Thu, 16 Feb 2023 08:42:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PHRjq6lWqz3cQV
	for <lists+linux-aspeed@lfdr.de>; Thu, 16 Feb 2023 18:42:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=KSe9yqoy;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=jk@codeconstruct.com.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=KSe9yqoy;
	dkim-atps=neutral
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PHRjR36whz3cLs
	for <linux-aspeed@lists.ozlabs.org>; Thu, 16 Feb 2023 18:42:03 +1100 (AEDT)
Received: by codeconstruct.com.au (Postfix, from userid 10000)
	id 35D4D200E3; Thu, 16 Feb 2023 15:42:00 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1676533320;
	bh=4WNgPVjHnkyd+O8qT3n0+qVAMObFFFxGFkSm7gNIyyc=;
	h=From:To:Cc:Subject:Date;
	b=KSe9yqoyHL6hKI3XVVLn+TrKbxor3hAZuifCG1iXSrz7es7wQGnt+jzQtDV1zBJBS
	 nQ4o14z7Qp1Cud/UoYhKe6vyhkSUNLVxl/2OrkSl1TVMEVGqy4daaJfyd/2R3tJs8d
	 p3LfCXsqDbHT8fRnwBWAIkH/HyiSmpAZh2k/2doQtiqCaF1C80bT8SOY45T7MeBzxK
	 DqOJHpe4hGrve7dXH3zpOBAF74KBWt/mMvrtb75OrjrJQZceKTlzNQfqvWvULD1KCL
	 kcunY8cORDGx7DYNihRmVZC5PbnHGAK6aidU9aAicWQp2Irs8jfavEJg0zTp3qMFgM
	 Ohbvs0FGmK/3Q==
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: linux-i3c@lists.infradead.org
Subject: [PATCH 0/4] i3c: Add support for ast2600 i3c controller
Date: Thu, 16 Feb 2023 15:41:51 +0800
Message-Id: <cover.1676532146.git.jk@codeconstruct.com.au>
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
Cc: Vitor Soares <ivitro@gmail.com>, devicetree@vger.kernel.org, Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-aspeed@lists.ozlabs.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

The AST2600 SoC hardware includes a set of i3c controllers, based on the
designware i3c core, plus some global registers for SoC integration.

This series adds support for these i3c controllers, through the existing
dw i3c master controller driver, by adding a set of platform-specific
hooks to handle the global register configuration. This also gives us a
way to add any future hardware-specific behaviours.

We also need a DT binding to describe the ast2600-specific hardware.
Since this involves new (mandatory) properties, I have added this as a
separate binding rather than add a new compat string to the dw binding.

The dt-binding example depends on a prior submission to the dt binding
headers:

  https://lore.kernel.org/linux-devicetree/cover.1676294433.git.jk@codeconstruct.com.au/

Full support for the global regmap will land with this queued mfd change:

  https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git/commit/?id=cf2271843de835839e91c5c036492a87085af756

Of course, any queries/comments/etc are most welcome.

Cheers,


Jeremy

Jeremy Kerr (4):
  dt-bindings: i3c: Add AST2600 i3c controller
  i3c: dw: Add platform operations
  i3c: dw: Add AST2600 platform ops
  i3c: dw: Add compatible string for ASPEED AST2600 BMC platform

 .../bindings/i3c/aspeed,ast2600-i3c.yaml      |  73 ++++++++
 drivers/i3c/master/dw-i3c-master.c            | 165 +++++++++++++++++-
 2 files changed, 232 insertions(+), 6 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/i3c/aspeed,ast2600-i3c.yaml

-- 
2.39.1

