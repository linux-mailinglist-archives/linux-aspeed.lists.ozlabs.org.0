Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EDB19181B1
	for <lists+linux-aspeed@lfdr.de>; Wed, 26 Jun 2024 15:06:34 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Fb0HU+ta;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W8MQt3wstz3cgW
	for <lists+linux-aspeed@lfdr.de>; Wed, 26 Jun 2024 23:06:30 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Fb0HU+ta;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62b; helo=mail-pl1-x62b.google.com; envelope-from=yangchen.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W8MQM6ghnz3cYV
	for <linux-aspeed@lists.ozlabs.org>; Wed, 26 Jun 2024 23:06:03 +1000 (AEST)
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1fa1a542466so5171015ad.0
        for <linux-aspeed@lists.ozlabs.org>; Wed, 26 Jun 2024 06:06:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719407162; x=1720011962; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fqsSYdsGNy1ml2i2nb2KczLx9uSIN7hDvVpf7dyFvwY=;
        b=Fb0HU+taz0Q7oIfif+yVzkuMTkz/z24XE/dGcy9z9s6G/SVfpew5JR0jHqsfs4uLY6
         VrmtIGG9dIINPx4t8EsvDohz0zzqvRC8H1mBxsQbD2noWNN0SBPFf8a5qSuBra/3cv9j
         tPKpaM9O97awEc2h7siEc+JvRckaqg2lbBinzlqkGfD+4HV3QgxrRFEOcWXfzDrtpvew
         K25RN13IFYu8lEWQkr32xlS432IbXmZy/T9KiMwCNQwXtHfuapcoW6LRCwZ38SifTxaA
         Ux1akSBQWiKGZRRRyIYZkJ3eU3+P2eBiJLjhjUtiGZwUE6j9M5AKuGNeyytlEvPcWylE
         AvbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719407162; x=1720011962;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fqsSYdsGNy1ml2i2nb2KczLx9uSIN7hDvVpf7dyFvwY=;
        b=FMNUecHVSYhUMTEs2zccoU49TK5NFUlrth5oZe+f/4HaFSxgepSTugH4wp6+HcQTzz
         tzBtq78mn+m0s12PIHFNboy38SNGGrp2YiMqde5Oep18BfB+Jqmbb9ARBbbwjqEKimbw
         HdiMacgcPUwyc6FkuJv87z6aHl1LkEoCBFtfdznkdJ1wNB5wERH/+okU/DYBklNwnwI+
         HEZmDzICCXkGg050rZ/P7VWGS7l/mXDQm3G9m0S3XWVk8Ixj5TJy9HiJpydJjsTBt8Oz
         7VW+sbikpfc3PEQFtoU8fqbqY3H3wGlRRRjbPF2+iUGCnGhKhSO5/jKEMS3Aftt43f7a
         XdKg==
X-Forwarded-Encrypted: i=1; AJvYcCXjM0xr6z59L8wr5GZ/B0EkO4jP+zHoLedtf7UTJ09o9PKQWFUZFm3uFHt//lxunlsWEJ/sXcojKzN9AYp3pdHQMNEmQpnyH/jRS0iD6A==
X-Gm-Message-State: AOJu0Yx4mP6TQF/GfjpiLl4o9P8Tdo7iohvM8dCjI4k2bsCSuXtbSJX4
	K+AjcuPW1lLISmKzZG9k4viUoExR+bj+cqqSp7YbBZGr+FjA08Cj
X-Google-Smtp-Source: AGHT+IEquapQGluFst4GQTayITLbBV+AzezwxNVM3Yrgm4DVdGViRjtWItWW9QO2qQLajyEKCKgzSw==
X-Received: by 2002:a17:902:f70b:b0:1fa:918e:eb8 with SMTP id d9443c01a7336-1fa918e117fmr18861285ad.47.1719407162220;
        Wed, 26 Jun 2024 06:06:02 -0700 (PDT)
Received: from obliging-System-Product-Name.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f9eb7cf885sm99112395ad.224.2024.06.26.06.06.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 06:06:01 -0700 (PDT)
From: Yang Chen <yangchen.openbmc@gmail.com>
To: joel@jms.id.au,
	andrew@codeconstruct.com.au,
	patrick@stwcx.xyz,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v1 10/17] ARM: dts: aspeed: minerva: enable ehci0 for USB
Date: Wed, 26 Jun 2024 21:03:25 +0800
Message-Id: <20240626130332.929534-11-yangchen.openbmc@gmail.com>
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

Enable ehci0 for USB.

Signed-off-by: Yang Chen <yang.chen@quantatw.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
index f41dcb36243a..fd769578f826 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
@@ -531,6 +531,10 @@ &adc1 {
 	pinctrl-0 = <&pinctrl_adc10_default>;
 };
 
+&ehci0 {
+	status = "okay";
+};
+
 &ehci1 {
 	status = "okay";
 };
-- 
2.34.1

