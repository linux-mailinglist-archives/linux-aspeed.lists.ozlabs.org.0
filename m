Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A269B530958
	for <lists+linux-aspeed@lfdr.de>; Mon, 23 May 2022 08:05:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L66Jj3fgNz3bfC
	for <lists+linux-aspeed@lfdr.de>; Mon, 23 May 2022 16:05:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20210705 header.b=upZsTQ/r;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=canonical.com (client-ip=185.125.188.122;
 helo=smtp-relay-internal-0.canonical.com;
 envelope-from=juerg.haefliger@canonical.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=canonical.com header.i=@canonical.com
 header.a=rsa-sha256 header.s=20210705 header.b=upZsTQ/r; 
 dkim-atps=neutral
Received: from smtp-relay-internal-0.canonical.com
 (smtp-relay-internal-0.canonical.com [185.125.188.122])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L66JY4kvDz2ypj
 for <linux-aspeed@lists.ozlabs.org>; Mon, 23 May 2022 16:05:48 +1000 (AEST)
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id DF2ED3F1FF
 for <linux-aspeed@lists.ozlabs.org>; Mon, 23 May 2022 06:05:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1653285943;
 bh=Gc6m3XcjXFZK4IY7snllrwp4xXxt/PdhQGyQJtEizR4=;
 h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
 b=upZsTQ/rbzceDs6k0wzhn+8e/oYiDLKDr5WaFwTBms5LEICimW6DW6StNeIy64/6N
 eq6tIS8v0LljwlRFCo37APv5vuaJQ+q0qKAGccW0Oo719xIerClTMNDI71BUCGZvgv
 Lu7b2hGyupFU1u5BdG/GmnVt+Y7KRfkwhBXjgdmDuJ3liEcIjQdv6noH3civJZcFZu
 sMZNht1VBzx+oayRESp6Brp65xsc+xv5MoJbk2B6C4UrqE5BrIWUHjQCQn6miG+Epj
 UU7mBhmyhBxCPirh7AoOk1O1CpXTCQsyy1HSwXurUTM7ciOR5IgYqi8y6Suc8yYHRk
 tIZGoHPiusYeQ==
Received: by mail-ed1-f69.google.com with SMTP id
 i22-20020aa7dd16000000b0042a9f9e2272so9961788edv.6
 for <linux-aspeed@lists.ozlabs.org>; Sun, 22 May 2022 23:05:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Gc6m3XcjXFZK4IY7snllrwp4xXxt/PdhQGyQJtEizR4=;
 b=PfSi7G1HDrs+g6URlxLhquGPB8WK+MRkrpkFe29dbBiTkOj5yvPRuFY8xyEYIz1xrr
 Cj/IftfvpZa5GzkSZTyas+rQfI9Ox7H+q8YOwRLaT8Sayv7+EQGE3xKHIvcdgGVEFtRN
 XonNXy9UYDG2eGD5uctoWtlb1GpXCC48k8xlOp52M6DpGG8bjwQRYmRHARSAGLgE1IDJ
 76Xf81lwuSJNVeDMlAPQ9ZAiB27wVT6crtJBSBtTicwuMB78CKzrxd7ut1Fl9eF5QUno
 5ZIVh2MVtoXTrwHDlw2EPqa/OYE0z/Kp8zgUioAVylUtv0U459nQ94aCmTutO0flFWHS
 1kZQ==
X-Gm-Message-State: AOAM532AGJigSxwFG1HtZhlExCKkiOno+DZK0eqTpUK93uiDq79b5T3N
 V7te42X+1VWDPVQk3s2NWnXYiAt03IhqXmofJwk+N1nziVGNQETvW4cg8ucdBfUfKh3t494CaeP
 H0dRBd4StoqXsVgCCwwa6TrOv07CJHAZWkK5l9gTRIco=
X-Received: by 2002:a05:6402:84c:b0:428:4cc4:8212 with SMTP id
 b12-20020a056402084c00b004284cc48212mr22595231edz.171.1653285942133; 
 Sun, 22 May 2022 23:05:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxkKR2r8E8Xx1iDAMXOgaBNrjjlnaFEXjGXVWac/Tu0AG+RwTJpLHCbpRGuD2/bKTDllS5fTA==
X-Received: by 2002:a05:6402:84c:b0:428:4cc4:8212 with SMTP id
 b12-20020a056402084c00b004284cc48212mr22595217edz.171.1653285941934; 
 Sun, 22 May 2022 23:05:41 -0700 (PDT)
Received: from gollum.fritz.box ([194.191.244.86])
 by smtp.gmail.com with ESMTPSA id
 p23-20020a056402155700b0042617ba6389sm7777293edx.19.2022.05.22.23.05.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 May 2022 23:05:41 -0700 (PDT)
From: Juerg Haefliger <juerg.haefliger@canonical.com>
X-Google-Original-From: Juerg Haefliger <juergh@canonical.com>
To: linux@armlinux.org.uk, joel@jms.id.au, andrew@aj.id.au,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org
Subject: [PATCH] ARM: aspeed: Kconfig: Fix indentation
Date: Mon, 23 May 2022 08:05:32 +0200
Message-Id: <20220523060532.7864-1-juergh@canonical.com>
X-Mailer: git-send-email 2.32.0
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
Cc: Juerg Haefliger <juergh@canonical.com>, linux-kernel@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

The convention for indentation seems to be a single tab. Help text is
further indented by an additional two whitespaces. Fix the lines that
violate these rules.

Signed-off-by: Juerg Haefliger <juergh@canonical.com>
---
 arch/arm/mach-aspeed/Kconfig | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm/mach-aspeed/Kconfig b/arch/arm/mach-aspeed/Kconfig
index ea96d11b8502..e05997ec2f82 100644
--- a/arch/arm/mach-aspeed/Kconfig
+++ b/arch/arm/mach-aspeed/Kconfig
@@ -19,9 +19,9 @@ config MACH_ASPEED_G4
 	select PINCTRL_ASPEED_G4
 	select FTTMR010_TIMER
 	help
-	 Say yes if you intend to run on an Aspeed ast2400 or similar
-	 fourth generation BMCs, such as those used by OpenPower Power8
-	 systems.
+	  Say yes if you intend to run on an Aspeed ast2400 or similar
+	  fourth generation BMCs, such as those used by OpenPower Power8
+	  systems.
 
 config MACH_ASPEED_G5
 	bool "Aspeed SoC 5th Generation"
@@ -29,8 +29,8 @@ config MACH_ASPEED_G5
 	select PINCTRL_ASPEED_G5
 	select FTTMR010_TIMER
 	help
-	 Say yes if you intend to run on an Aspeed ast2500 or similar
-	 fifth generation Aspeed BMCs.
+	  Say yes if you intend to run on an Aspeed ast2500 or similar
+	  fifth generation Aspeed BMCs.
 
 config MACH_ASPEED_G6
 	bool "Aspeed SoC 6th Generation"
@@ -40,7 +40,7 @@ config MACH_ASPEED_G6
 	select ARM_GIC
 	select HAVE_ARM_ARCH_TIMER
 	help
-	 Say yes if you intend to run on an Aspeed ast2600 or similar
-	 sixth generation Aspeed BMCs.
+	  Say yes if you intend to run on an Aspeed ast2600 or similar
+	  sixth generation Aspeed BMCs.
 
 endif
-- 
2.32.0

