Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C74C9181A7
	for <lists+linux-aspeed@lfdr.de>; Wed, 26 Jun 2024 15:06:07 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=kdAhg9Od;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W8MQN0Jwxz3cR1
	for <lists+linux-aspeed@lfdr.de>; Wed, 26 Jun 2024 23:06:04 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=kdAhg9Od;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62a; helo=mail-pl1-x62a.google.com; envelope-from=yangchen.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W8MQ56wSNz3cVy
	for <linux-aspeed@lists.ozlabs.org>; Wed, 26 Jun 2024 23:05:49 +1000 (AEST)
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1fa244db0b2so30785765ad.3
        for <linux-aspeed@lists.ozlabs.org>; Wed, 26 Jun 2024 06:05:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719407147; x=1720011947; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qvuY3ldSDbcqRp6kVC4EYjFVqjffzG4NqWLDYEbzrrs=;
        b=kdAhg9Od35wxRR8vn4ZJny/MV5KTZqCb7UR+yfTZ5wTdC9bTQ8MxYm72LziGQ2CY3x
         0X0MXynTkxPFGjZFeBgjxR+PDlt0lO+cYwPT82pvcla6ALiBzMMIy286Yj+bt1SrasMA
         qi4DPHVa8FkjXl0iCwdNnD+/15dHh9gTeSfkBA+0s6UtJ1D9WprV5aTY9QFoStiSU4qM
         7Z0kgndZQeeG6DcX+TqH2/1o91lDvDaboPmrS3kWjGZUz1Me5Hu7JFaoyuNAtx/W043i
         IOThGFc37nSTAf1VN0OAtL91Z/VQd5JFFco3CyojlWBs9dAfKfntFgdCFXWxdtDujujJ
         nuQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719407147; x=1720011947;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qvuY3ldSDbcqRp6kVC4EYjFVqjffzG4NqWLDYEbzrrs=;
        b=oVOE78U1Xn2BlhZqj3z826Ea7CixRD6KHrarE7rSMhk0zQVurhL7nzCE+eh4bepXo3
         K44crlQPdjJDx/gkLU4JRLYsEiLgZ0kJCr/tZzUd683f1rqGR20b773d889OxS2RqO2H
         tYkXku7RmdGl699FGRcqhUJ8iyrWBiQ2rdVvNAmwgZTFxMwTkM+H5l+iD2DAPXBm5hJn
         ZV1OBUml4hgv+P+FNogzkfKKGEpbHH/y2glr9fi/dStkGRhDqlLa71H1Wq6dpQQAeOnf
         yamhs4jSEfwVCGw/fLIPDlxL48e8FU1UOPoz+s3kw0VQ1g/3gDJgLCEd2rjS1rdDnqft
         T5UA==
X-Forwarded-Encrypted: i=1; AJvYcCVjSzTcKk9il+Qytv4UVmmD8//SmmKiMOCcgxfE7t6DPIkw9rz4LwXHRgDCMru+SkQWKnQgh/tScMROrfAmGYcuzrCHrLTsHrQYZetWBQ==
X-Gm-Message-State: AOJu0Yyq36hAw0ANLpehAPfpZGZdRhpfRujTuMv6E3M+PIng0LmLZlL2
	M+nbjoLOn1KSFQX/wW2/XO2bGtIBUk5RdBJcpgWxF0ZqOkC+X/CH
X-Google-Smtp-Source: AGHT+IF7k8/xopSiQnMd+dDRd1AFXUiY3Twnz1eQs9MwN3NWMKhwtdROWWSZT0freSQdfdUJPpI80w==
X-Received: by 2002:a17:902:e751:b0:1fa:2d0:f85b with SMTP id d9443c01a7336-1fa15937c59mr109719655ad.49.1719407147474;
        Wed, 26 Jun 2024 06:05:47 -0700 (PDT)
Received: from obliging-System-Product-Name.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f9eb7cf885sm99112395ad.224.2024.06.26.06.05.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 06:05:47 -0700 (PDT)
From: Yang Chen <yangchen.openbmc@gmail.com>
To: joel@jms.id.au,
	andrew@codeconstruct.com.au,
	patrick@stwcx.xyz,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v1 04/17] ARM: dts: aspeed: minerva: change RTC reference
Date: Wed, 26 Jun 2024 21:03:19 +0800
Message-Id: <20240626130332.929534-5-yangchen.openbmc@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240626130332.929534-1-yangchen.openbmc@gmail.com>
References: <20240626130332.929534-1-yangchen.openbmc@gmail.com>
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
Cc: Jerry.Lin@quantatw.com, yangchen.openbmc@gmail.com
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

From: Yang Chen <yang.chen@quantatw.com>

Change the RTC reference from on-chip to externel on i2c bus 9 and address
is 0x51.

Signed-off-by: Yang Chen <yang.chen@quantatw.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
index 60002b8cffc6..cd321482aa09 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
@@ -95,10 +95,6 @@ flash@1 {
 	};
 };
 
-&rtc {
-	status = "okay";
-};
-
 &sgpiom0 {
 	status = "okay";
 	ngpios = <128>;
@@ -308,6 +304,11 @@ eeprom@50 {
 		compatible = "atmel,24c64";
 		reg = <0x50>;
 	};
+
+	rtc@51 {
+		compatible = "nxp,pcf8563";
+		reg = <0x51>;
+	};
 };
 
 &i2c10 {
-- 
2.34.1

