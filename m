Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A36A794B5CF
	for <lists+linux-aspeed@lfdr.de>; Thu,  8 Aug 2024 06:14:58 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=AR/nq4T3;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WfYbZ4Fyqz3dLB
	for <lists+linux-aspeed@lfdr.de>; Thu,  8 Aug 2024 14:14:50 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=AR/nq4T3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WfYbV4XLbz3cRK
	for <linux-aspeed@lists.ozlabs.org>; Thu,  8 Aug 2024 14:14:46 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1723090486;
	bh=n3sZ4FsOpgBw2cpkxzXazcULuROCyRckfFE8WrKc23c=;
	h=From:Subject:Date:To:Cc;
	b=AR/nq4T3O36j2aPSH1YxOzliZ0Qdgq9WcseuCgPmIupAGuOvs7srJsccs9k33u6Ie
	 5vbN65GDaqWjfSoiCeNBdmbcRAT0wgJvHfYqonn6Dz1BPTsww7BuvDFEpMnwTmsth0
	 od7cGfbOdG8EHRvatmlXdLtHFGHeAVERDJKHkVLti1A4oxCT29tNeBM0WfWJfUhX5L
	 OPpJSqWN+dtEn15bpHag+HNMPW4rOkHyl9Y7SK2buA9CFAMyKJ7yyCCBXyEgFSr5Ih
	 STAx3nryVgYzW2dnKMcCMNY72yisErw2BO/70gFlE63UU4PviL87REmXQjcKULHbg6
	 VfcUOQdxSUKqQ==
Received: from [127.0.1.1] (203-57-213-111.dyn.iinet.net.au [203.57.213.111])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 65FFE654E9;
	Thu,  8 Aug 2024 12:14:45 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v2 0/2] dt-bindings: interrupt-controller: Convert Aspeed
 (C)VIC to DT schema
Date: Thu, 08 Aug 2024 13:44:23 +0930
Message-Id: <20240808-dt-warnings-irq-aspeed-dt-schema-v2-0-c2531e02633d@codeconstruct.com.au>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAB9GtGYC/5WNQQ6DIBAAv2I4dw1SNLan/qPxQNhV9yBYQNvG+
 PeiP+hx5jCziUiBKYp7sYlAK0f2LoO6FMKOxg0EjJmFkkrLVirABG8THLshAocXmDgT4aGjHWk
 yUPc19VijvlZG5MwcqOfPuXh2mUeOyYfveVyrw/4RXyuQ0FrUqmlQyZt+WI9kvYspLDaV1k+lW
 US37/sPWyakwtsAAAA=
To: Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hello,

This short series converts the Aspeed VIC and CVIC bindings over to DT
schema. The CVIC has historically been documented under "misc" as it's
the interrupt controller for the Coldfire co-processor embedded in the
SoCs, and not for the main ARM core. Regardless, I've updated both in
this series.

I tried to document the historical oddities and conversion quirks in the
commit messages where appropriate.

Please review!

Andrew

---
Changes in v2:
- Address feedback from Krzysztof
  - https://lore.kernel.org/r/c51fb027-f8bd-4b10-b9c0-dbbe8e8cf4c1@kernel.org/
  - https://lore.kernel.org/r/ec19fe07-84bd-4c32-a886-e6126af52f4c@kernel.org/
- Address feedback from Rob
  - https://lore.kernel.org/r/20240806172917.GA1836473-robh@kernel.org/
- Link to v1: https://lore.kernel.org/r/20240802-dt-warnings-irq-aspeed-dt-schema-v1-0-8cd4266d2094@codeconstruct.com.au

---
Andrew Jeffery (2):
      dt-bindings: interrupt-controller: aspeed,ast2400-vic: Convert to DT schema
      dt-bindings: misc: aspeed,ast2400-cvic: Convert to DT schema

 .../interrupt-controller/aspeed,ast2400-vic.txt    | 23 --------
 .../interrupt-controller/aspeed,ast2400-vic.yaml   | 62 ++++++++++++++++++++++
 .../bindings/misc/aspeed,ast2400-cvic.yaml         | 60 +++++++++++++++++++++
 .../devicetree/bindings/misc/aspeed,cvic.txt       | 35 ------------
 4 files changed, 122 insertions(+), 58 deletions(-)
---
base-commit: 8400291e289ee6b2bf9779ff1c83a291501f017b
change-id: 20240802-dt-warnings-irq-aspeed-dt-schema-5f5efd5d431a

Best regards,
-- 
Andrew Jeffery <andrew@codeconstruct.com.au>

