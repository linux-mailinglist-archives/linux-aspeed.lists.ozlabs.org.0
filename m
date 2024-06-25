Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AA110916782
	for <lists+linux-aspeed@lfdr.de>; Tue, 25 Jun 2024 14:21:18 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=CVekHJ/q;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W7kT71V9Tz3dJw
	for <lists+linux-aspeed@lfdr.de>; Tue, 25 Jun 2024 22:21:15 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=CVekHJ/q;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42e; helo=mail-pf1-x42e.google.com; envelope-from=yangchen.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W7kSh5sqDz3dJn
	for <linux-aspeed@lists.ozlabs.org>; Tue, 25 Jun 2024 22:20:52 +1000 (AEST)
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-70677422857so1565818b3a.2
        for <linux-aspeed@lists.ozlabs.org>; Tue, 25 Jun 2024 05:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719318052; x=1719922852; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wGiKCgocnymn+yHqK126jXlfsSgcwH3iwTb3bF9H5Lg=;
        b=CVekHJ/qAEkiFU/n2aYlfgEFFGPSGlumlaTTIP+/rN34Nm3dZ9qw8fUGB/rJ0TpGfX
         013tWtEA5fuSKIdrO2p6pgqlKtyXRsA1V5et9hZrVAN6+65ZgE1PPjKmGj334ZN94T67
         KgqBW8BC85fI1EKNKmgvwdXr5BW9RvTikiFi818rjgUrBMrAB1SJgF1ab+J3CWWYAsyL
         3AV12kva+qAMgTalyHEoBgr99xoFDBds0SGwdOoyKGQ4ow38OzHW8vqrfHg9xI1ShlZP
         5OV86l3RLIjGLtVqRCTqy2n9R3bPtrtC6VYDefqPmagHk0TI+v5mKE3lE+7F8DERDCp5
         gjDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719318052; x=1719922852;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wGiKCgocnymn+yHqK126jXlfsSgcwH3iwTb3bF9H5Lg=;
        b=OO2sHVRbbzK23+yURbKYTDlIr0kDCkkVtA7dqSriyyuQWgCW+rW+5JdYI3CldRGCTc
         UnJui86Nr+uIvzXlNihTGOOvhG0lQPyD9ynmPh+t94ZXppsZOD4iujK4AjO84ySOAoS+
         0TWBGg7AHF4Cd5yQCsYyleOUI5PHATSD2QKe9tDMgOPdagAbzUMb+1BS9KIF1fvL74V0
         +sEVn1MYgVpzc9b2NUKxM1kjNA0YVTn8SPnWfZQmexi49nmSJS5rEmhbFO4mWCMuMTwm
         gh7RdDZhIATyidjPIGEpaSdGydoqG+buHkwGgSNnyDCLbPiHRwD7ijwri0tZJhUFV7wR
         av8Q==
X-Forwarded-Encrypted: i=1; AJvYcCUNRWnZq7fzwx9OqbAuhxQv3GGRbkjLsYH/iDBu1TwJCRe0GiIPNkfNcYXcYZEFOXp4UWCfAcGjQU2T8q+3xs89WPmVnRlKPbN31nVnxA==
X-Gm-Message-State: AOJu0YwP2U5co+ug1vygRH4z4Nze7jIq3BnzzSKiGWrwN2JNbKgE+TXE
	6nhIXUv3W64V6u407F71VevN+zPmWzQSMiOIWMljw5KMRsDAB0FX
X-Google-Smtp-Source: AGHT+IEEPEHbmFKpDEhIVhgQPNqT88rVvqOmw5tPlFHrVpuX5vXa32ZKy/X+/Jzigl5dadnhr78QSA==
X-Received: by 2002:a05:6a20:9695:b0:1bd:126e:b4c1 with SMTP id adf61e73a8af0-1bd126eb6c4mr3358782637.7.1719318052386;
        Tue, 25 Jun 2024 05:20:52 -0700 (PDT)
Received: from obliging-System-Product-Name.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70650e312e4sm7978146b3a.0.2024.06.25.05.20.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 05:20:52 -0700 (PDT)
From: Yang Chen <yangchen.openbmc@gmail.com>
To: joel@jms.id.au,
	andrew@codeconstruct.com.au,
	patrick@stwcx.xyz,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 06/17] ARM: dts: aspeed: minerva: enable mdio3
Date: Tue, 25 Jun 2024 20:18:24 +0800
Message-Id: <20240625121835.751013-7-yangchen.openbmc@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240625121835.751013-1-yangchen.openbmc@gmail.com>
References: <20240625121835.751013-1-yangchen.openbmc@gmail.com>
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

Change usage of I2C bus 11 to mdio3.

Signed-off-by: Yang Chen <yang.chen@quantatw.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
index 32400284479e..4d67ef29023c 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
@@ -99,6 +99,10 @@ fixed-link {
 	};
 };
 
+&mdio3 {
+	status = "okay";
+};
+
 &fmc {
 	status = "okay";
 	flash@0 {
@@ -336,10 +340,6 @@ &i2c10 {
 	status = "okay";
 };
 
-&i2c11 {
-	status = "okay";
-};
-
 &i2c12 {
 	status = "okay";
 };
-- 
2.34.1

