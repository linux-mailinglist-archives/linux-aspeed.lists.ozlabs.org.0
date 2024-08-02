Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 154AF9457A1
	for <lists+linux-aspeed@lfdr.de>; Fri,  2 Aug 2024 07:36:59 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=LhaHG7pg;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WZvj41VF7z3dTx
	for <lists+linux-aspeed@lfdr.de>; Fri,  2 Aug 2024 15:36:56 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=LhaHG7pg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WZvhz0rJFz3cQH
	for <linux-aspeed@lists.ozlabs.org>; Fri,  2 Aug 2024 15:36:51 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1722577008;
	bh=Q47qJS2a9PBUFubzmNdKq1lpyf6zLMrCpRsxzpxyTKY=;
	h=From:Subject:Date:To:Cc;
	b=LhaHG7pgSk/HxGfyOUGpotSifTFcQtq68W50Yaw+fj1enh2H6g0mlzc1CyxBClzZq
	 Rtem8xpEUwiXywFpyfZpToreNoj/CV9HKdEN2UrWBqlON20gK+ScEwIB+ATsznk/EI
	 Lzzxu3haF58t2RhyJ0FW3UOVzwRQzBEmo+9c4sPHpNWOE05eH/KAgRUpVELnW4KaZP
	 zVGtOwD8Gd6ttucjMRxfIHQ+Sk6rJtJ+EdPLvDorbMuMVZ6dBzV8vAAcenTKp3/z0X
	 fgA7ZAuoaU+X6791VuAxDiWx+6YaI7APDWYpdHY3RVwuDUXcVLMvqdlIwNeUhOxYqX
	 kx/eIF0nzs/JQ==
Received: from [127.0.1.1] (ppp118-210-29-70.adl-adc-lon-bras31.tpg.internode.on.net [118.210.29.70])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 30DBE65665;
	Fri,  2 Aug 2024 13:36:46 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH 0/2] dt-bindings: interrupt-controller: Convert Aspeed
 (C)VIC to DT schema
Date: Fri, 02 Aug 2024 15:06:29 +0930
Message-Id: <20240802-dt-warnings-irq-aspeed-dt-schema-v1-0-8cd4266d2094@codeconstruct.com.au>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAF1wrGYC/x2NQQqDQAwAvyI5N7BuXSh+pXgIJqs5dLWJtAXx7
 109zhxmdnAxFYe+2cHko65LqdDeGhhnKpOgcmWIIXbhESLyhl+yomVyVHsj+SrCp/Zxlhdhykk
 yJ+7uLUHNrCZZf9fiORzHH8rbwqhyAAAA
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
Andrew Jeffery (2):
      dt-bindings: interrupt-controller: aspeed,ast2400-vic: Convert to DT schema
      dt-bindings: misc: aspeed,ast2400-cvic: Convert to DT schema

 .../interrupt-controller/aspeed,ast2400-vic.txt    | 23 --------
 .../interrupt-controller/aspeed,ast2400-vic.yaml   | 63 ++++++++++++++++++++++
 .../bindings/misc/aspeed,ast2400-cvic.yaml         | 60 +++++++++++++++++++++
 .../devicetree/bindings/misc/aspeed,cvic.txt       | 35 ------------
 4 files changed, 123 insertions(+), 58 deletions(-)
---
base-commit: 8400291e289ee6b2bf9779ff1c83a291501f017b
change-id: 20240802-dt-warnings-irq-aspeed-dt-schema-5f5efd5d431a

Best regards,
-- 
Andrew Jeffery <andrew@codeconstruct.com.au>

