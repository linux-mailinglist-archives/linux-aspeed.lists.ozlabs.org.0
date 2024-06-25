Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1332B916793
	for <lists+linux-aspeed@lfdr.de>; Tue, 25 Jun 2024 14:22:03 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=OsyYZXzv;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W7kTz47yZz3dWF
	for <lists+linux-aspeed@lfdr.de>; Tue, 25 Jun 2024 22:21:59 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=OsyYZXzv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::433; helo=mail-pf1-x433.google.com; envelope-from=yangchen.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W7kT81HcKz3dWW
	for <linux-aspeed@lists.ozlabs.org>; Tue, 25 Jun 2024 22:21:15 +1000 (AEST)
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-70673c32118so1882230b3a.3
        for <linux-aspeed@lists.ozlabs.org>; Tue, 25 Jun 2024 05:21:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719318074; x=1719922874; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oQQJMKc5pwaISrJte7FnhWZFwpzsNSJyBnkbk9/BOc8=;
        b=OsyYZXzvoFBUNJ7YCqNgeW6Lo29d9Mi+teWVDuCNUjWujKnCRbjcHZzfEMa+nqoEIp
         Q1fnXVoXHnzgi7TmKhbvGImNG1/Ydr4i0R6v6FGySh4moBdvOTmnFIorF+5vE7zOxEYQ
         VQIYwCJ0LdJ58WWNVX2lX2NRYlNTxAJeCrAqzKMbgPya8l3cLPs/E/TdVqTWqKlLPTwa
         TNK2frxg/kgB4YE4JEbvGGa4c0oLfGlU1UQWmyymb5qlwiKkXtWU9S0zwC+9PuEbscaQ
         wNl98yM7xJdXTXHRpoXqWH0excYmQ8/I9bB3/+Xrhh8UnVry/sSTUoaKxXQs3jG/LFex
         PSsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719318074; x=1719922874;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oQQJMKc5pwaISrJte7FnhWZFwpzsNSJyBnkbk9/BOc8=;
        b=FQB2GQU6DuDpg1riTdtRIbDR9/lw3FwbS2lETiy50LdQC4laEe7rAeog4BHJP0701E
         v7BMA38z1MtTWoz5ht6eMJ8Ldk7s23FeapoXDsYfUGm8v159EKdzuo9ymlacGMy0uhcD
         fGjkYxGdRvtVVfMWdnov0Yq8oMUdt/bkjdU6gnHFkPunAbXrEhmQO5bRfyEk8G/hJH2n
         MJb1bkcoU0++o9AmHWZKo/92TWhBWT4CftQapf4iQaF0VAwlbwzyLsA91roqLzMOB+Dr
         M7n/B0MaJ/mAl00boWrxaG4eHqOcg3vsWez8gq/u/VVT/3BB0Bi84jOwHp/lTMbTeJ7S
         OKQw==
X-Forwarded-Encrypted: i=1; AJvYcCUZCCglETbw/3rfCs326UGXBgxs2o3vBAuCLVNNWl47npCqWR59p9AYC6q49Io7KnwgnDRc0PiZWPZmYQBF1+2ZOO027gMC2BrproxxDw==
X-Gm-Message-State: AOJu0Ywt7vRh6hYYSD8hDVtCu4k7G1smfqWoINdyHxH80eDRHMH+DvYr
	0SBpxfWGs+pR7KaWfsKO6WtvZweuWorm5nTJFTzEdE8MhMQq0yEF
X-Google-Smtp-Source: AGHT+IHuC5Cksz3HgmWz6HbqABAZAwsPRe5VrgqQz/iIA0Dgrph3x8gvPVvzvgAM8V48U1SA/+xHTQ==
X-Received: by 2002:a05:6a20:1e55:b0:1b7:b55:c87a with SMTP id adf61e73a8af0-1bcf7ff997amr5431513637.53.1719318074441;
        Tue, 25 Jun 2024 05:21:14 -0700 (PDT)
Received: from obliging-System-Product-Name.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70650e312e4sm7978146b3a.0.2024.06.25.05.21.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 05:21:14 -0700 (PDT)
From: Yang Chen <yangchen.openbmc@gmail.com>
To: joel@jms.id.au,
	andrew@codeconstruct.com.au,
	patrick@stwcx.xyz,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 16/17] ARM: dts: aspeed: minerva: remove unused power device
Date: Tue, 25 Jun 2024 20:18:34 +0800
Message-Id: <20240625121835.751013-17-yangchen.openbmc@gmail.com>
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

Remove unused power device.

Signed-off-by: Yang Chen <yangchen.openbmc@gmail.com>
---
 .../boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts    | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
index 8dd2bbb15576..288d4ba06b99 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
@@ -165,16 +165,6 @@ power-monitor@41 {
 		shunt-resistor = <1000>;
 	};
 
-	power-monitor@67 {
-		compatible = "adi,ltc2945";
-		reg = <0x67>;
-	};
-
-	power-monitor@68 {
-		compatible = "adi,ltc2945";
-		reg = <0x68>;
-	};
-
 	power-monitor@43 {
 		compatible = "infineon,xdp710";
 		reg = <0x43>;
-- 
2.34.1

