Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E1DD3165DC
	for <lists+linux-aspeed@lfdr.de>; Wed, 10 Feb 2021 13:00:42 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DbJHV6wd9zDvYK
	for <lists+linux-aspeed@lfdr.de>; Wed, 10 Feb 2021 23:00:38 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1036;
 helo=mail-pj1-x1036.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Mid58bw7; dkim-atps=neutral
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DbHzs6MTVzDrWX
 for <linux-aspeed@lists.ozlabs.org>; Wed, 10 Feb 2021 22:47:04 +1100 (AEDT)
Received: by mail-pj1-x1036.google.com with SMTP id my11so2840735pjb.1
 for <linux-aspeed@lists.ozlabs.org>; Wed, 10 Feb 2021 03:47:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SquWdczocRj1Zqc41Sdg/xRUhoXlPE28+OwXR1sRajo=;
 b=Mid58bw7ffch7T1M2/MyOoryBoEljUfP90Q4leXFY4Bb30y8u8tC4mYwm0byAeeF5D
 JXWfq8uwtEVUKsYc8X8zKx7EtiiLMPf9mK8Cjcq7HuMwTgqE/dqYaiYiw/zKfvEUWJfY
 fSoqnnRyf5iU4bYJCV/gawmA04vyawlUbnVAoYgg+/wq1NhCmi77Kz9CnDww6UB6/4Kd
 oS2gHZyooLjnNnU2wpUn5nBNEYbya+peyss/G5/jHteHMQWjVrWxo76xsP8Tr7MBGc6p
 zQJRWG1qTNoTqHIUvCaX66mMZl4HWLtVM9x+V5ZhsDTv4Secd/X/QmmxpkJ0diy3ugpe
 U7Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=SquWdczocRj1Zqc41Sdg/xRUhoXlPE28+OwXR1sRajo=;
 b=dswFro/RwgXBOXPnzpsF/51utZmDZivkxhz1iZHw/Vt5clDEr76aPMOJmymjYNpOHm
 bQFT8TlicW4en6Vzz4iPGM6/3vn4dMr3vg7pLNclTeRVxN0/hJfnFW28yZDKW5rZWT06
 2efkRCod7vnUwbr1/l7tmYMI8MpXcBr6nbAdHd/BgzmpF+h1ixoTpJvsXvhD+FLmMlGJ
 3Cr8KFlyxHw6BY/r0T8Cbn9QWAtJBx6wsS21g3v0v2Y5oSZbNF5Vtjm/J477MtzUQYP+
 iBNsV4cgjl5/5Y+QfKJ4dIPDmZ3n7xYCxwYklGCSwPEr43sy2+tZYSwhLrQ0x1Prx6g1
 uYdg==
X-Gm-Message-State: AOAM530oAfo7Ih31o5qUA9nsqMoajKnaDgD5nr5EsbbG20X7f8SdlOV5
 Ix/irDow8L+Z+5avI39GpH0=
X-Google-Smtp-Source: ABdhPJw/l0zMA7OWPgNPe6WecQDh+3gZsciN6poYlVqsk6C/q5SwxJ5qMlYM3SW+llkrW4kx3WxwIA==
X-Received: by 2002:a17:90a:ba0b:: with SMTP id
 s11mr2797767pjr.182.1612957619956; 
 Wed, 10 Feb 2021 03:46:59 -0800 (PST)
Received: from localhost.localdomain ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id e12sm2096216pjj.23.2021.02.10.03.46.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Feb 2021 03:46:58 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
To: Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH] soc: aspeed: socinfo: Add new systems
Date: Wed, 10 Feb 2021 22:16:51 +1030
Message-Id: <20210210114651.334324-1-joel@jms.id.au>
X-Mailer: git-send-email 2.30.0
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
Cc: linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Aspeed's u-boot sdk has been updated with the SoC IDs for the AST2605
variant, as well as A2 and A3 variants of the 2600 family.

From u-boot's arch/arm/mach-aspeed/ast2600/scu_info.c:

    SOC_ID("AST2600-A0", 0x0500030305000303),
    SOC_ID("AST2600-A1", 0x0501030305010303),
    SOC_ID("AST2620-A1", 0x0501020305010203),
    SOC_ID("AST2600-A2", 0x0502030305010303),
    SOC_ID("AST2620-A2", 0x0502020305010203),
    SOC_ID("AST2605-A2", 0x0502010305010103),
    SOC_ID("AST2600-A3", 0x0503030305030303),
    SOC_ID("AST2620-A3", 0x0503020305030203),
    SOC_ID("AST2605-A3", 0x0503010305030103),

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 drivers/soc/aspeed/aspeed-socinfo.c | 33 ++++++++++++++++++++++-------
 1 file changed, 25 insertions(+), 8 deletions(-)

diff --git a/drivers/soc/aspeed/aspeed-socinfo.c b/drivers/soc/aspeed/aspeed-socinfo.c
index 773930e0cb10..e3215f826d17 100644
--- a/drivers/soc/aspeed/aspeed-socinfo.c
+++ b/drivers/soc/aspeed/aspeed-socinfo.c
@@ -25,6 +25,7 @@ static struct {
 	/* AST2600 */
 	{ "AST2600", 0x05000303 },
 	{ "AST2620", 0x05010203 },
+	{ "AST2605", 0x05030103 },
 };
 
 static const char *siliconid_to_name(u32 siliconid)
@@ -43,14 +44,30 @@ static const char *siliconid_to_name(u32 siliconid)
 static const char *siliconid_to_rev(u32 siliconid)
 {
 	unsigned int rev = (siliconid >> 16) & 0xff;
-
-	switch (rev) {
-	case 0:
-		return "A0";
-	case 1:
-		return "A1";
-	case 3:
-		return "A2";
+	unsigned int gen = (siliconid >> 24) & 0xff;
+
+	if (gen < 0x5) {
+		/* AST2500 and below */
+		switch (rev) {
+		case 0:
+			return "A0";
+		case 1:
+			return "A1";
+		case 3:
+			return "A2";
+		}
+	} else {
+		/* AST2600 */
+		switch (rev) {
+		case 0:
+			return "A0";
+		case 1:
+			return "A1";
+		case 2:
+			return "A2";
+		case 3:
+			return "A3";
+		}
 	}
 
 	return "??";
-- 
2.30.0

