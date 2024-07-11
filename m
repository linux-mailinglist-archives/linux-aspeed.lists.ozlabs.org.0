Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 07ED292E8D6
	for <lists+linux-aspeed@lfdr.de>; Thu, 11 Jul 2024 15:07:24 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=YpDtbDz3;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WKZkw03JYz3bnt
	for <lists+linux-aspeed@lfdr.de>; Thu, 11 Jul 2024 23:07:20 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=YpDtbDz3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62a; helo=mail-pl1-x62a.google.com; envelope-from=yangchen.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WKZkl220dz3bnt
	for <linux-aspeed@lists.ozlabs.org>; Thu, 11 Jul 2024 23:07:10 +1000 (AEST)
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1fb53bfb6easo5820965ad.2
        for <linux-aspeed@lists.ozlabs.org>; Thu, 11 Jul 2024 06:07:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720703228; x=1721308028; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0jnve3iMfQ3N9VA7fI/ITJkN0F4YPFwznhKUmalCiOE=;
        b=YpDtbDz3KDHmpE7nVmeyree5DIvUvoCocdF1sAFJvnmVBWz1mc7m7UyLI06fzpqlTd
         xis9OGN8neH4CZfBk3KaZyswlUH42wHhkf+Np8/ntlhQAIbmxoXSvsmHdU+75B1scQKN
         +n3KLvvJAM4nli27V8hxnf1W2CuRjYEOqYloNPMAVjTTIBwERVtnG05ENiCFxOs8YgCG
         9cvGTuND1DPnIKo002EU9jHDmk17SzuSOC6W+hOJ19mX39+VwMiDfcpW4mOcMdR/MH8/
         18sHTi5HgSSI61CyfJ7jlzS5TSJdlPbtlxQEAziID77Tx8PcOyDA4HccK0qHFJlpW769
         kkpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720703228; x=1721308028;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0jnve3iMfQ3N9VA7fI/ITJkN0F4YPFwznhKUmalCiOE=;
        b=Dn/MrRUYFvvjb+tFjgtfuxtbpOaD67SKOGzKrHSZT5PLrVsaW9I1DK4F+pdWIyIhT6
         22piXbN5v0ADU+3I34l+9ddby4SCxf78tt0BG7edS/yk4i7gRyoedUqKZDEyq1TQS6/G
         MuB51K8m2MAgvoUFnb9AnkmGnojANrXshp/MxLu5g0Sc9sC+kpWixDGGTtxTVARFCPZW
         FmNeibPzdBnSUNVmRNmD8S5a1qCDMKUZTnqsb9yx5aaziNKP10Q3zn3ATkxcmZOfAzwI
         FzYr1C6x6RQ5T47ViIXis0U9P8mWsI4nmvuMYLuGvvqy7mo9RqJRiijotfJnKWZ3wZe7
         Mf5A==
X-Forwarded-Encrypted: i=1; AJvYcCVnajKNvLYVzFDV9l9s2O7TCEDbuwhqdcIsD3EH6bsOTt16s6Ws8TPrjsaCM2BcWkwatVX8C+rGkQ0z7cdqHwMEZRHJTVl04yIyBYrsoA==
X-Gm-Message-State: AOJu0YwY9X9V/o9vkf8I5XhgmG8gOR3k9gKanHIiYSovMkja5GnwJ6+t
	YW/XCQZy7AoStp/CAfjce4TBJBSuqYhJ3aVQWx2LHqVggNhpIgaw
X-Google-Smtp-Source: AGHT+IEmrIGHOBFSqXd81RIMGrfzoPUeUGC1m4BCECre0JDGSNlum8QRpsMZAkW8rPcHp3wUnUdxkw==
X-Received: by 2002:a17:903:2352:b0:1fa:47b7:2e41 with SMTP id d9443c01a7336-1fbb6ce5288mr74016295ad.1.1720703227962;
        Thu, 11 Jul 2024 06:07:07 -0700 (PDT)
Received: from obliging-System-Product-Name.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fbb6a10868sm50188305ad.9.2024.07.11.06.07.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jul 2024 06:07:07 -0700 (PDT)
From: Yang Chen <yangchen.openbmc@gmail.com>
To: joel@jms.id.au,
	andrew@codeconstruct.com.au,
	patrick@stwcx.xyz,
	amithash@meta.com,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v1 1/1] ARM: dts: aspeed: minerva: add host0-ready pin
Date: Thu, 11 Jul 2024 21:05:01 +0800
Message-Id: <20240711130501.2900301-2-yangchen.openbmc@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240711130501.2900301-1-yangchen.openbmc@gmail.com>
References: <20240711130501.2900301-1-yangchen.openbmc@gmail.com>
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
Cc: Jerry.Lin@quantatw.com, yangchen.openbmc@gmail.com, yang.chen@quantatw.com
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Add host0-ready pin for phosphor-state-manager.

Signed-off-by: Yang Chen <yangchen.openbmc@gmail.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
index f5ac248097b4..41e2246cfbd1 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
@@ -613,7 +613,7 @@ &gpio0 {
 	/*P0-P7*/	"","","","","","","","",
 	/*Q0-Q7*/	"","","","","","power-chassis-control","","",
 	/*R0-R7*/	"","","","","","","","",
-	/*S0-S7*/	"","","","","","","","",
+	/*S0-S7*/	"","","","","","","","host0-ready",
 	/*T0-T7*/	"","","","","","","","",
 	/*U0-U7*/	"","","","","","","","",
 	/*V0-V7*/	"","","","","BAT_DETECT","","power-chassis-good","",
-- 
2.34.1

