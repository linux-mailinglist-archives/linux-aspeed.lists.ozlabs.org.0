Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 844A6273B0E
	for <lists+linux-aspeed@lfdr.de>; Tue, 22 Sep 2020 08:43:00 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BwWw15K98zDqss
	for <lists+linux-aspeed@lfdr.de>; Tue, 22 Sep 2020 16:42:57 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::441;
 helo=mail-pf1-x441.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=BNTL7CFb; dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BwWvt4pywzDqTy
 for <linux-aspeed@lists.ozlabs.org>; Tue, 22 Sep 2020 16:42:49 +1000 (AEST)
Received: by mail-pf1-x441.google.com with SMTP id x123so11527212pfc.7
 for <linux-aspeed@lists.ozlabs.org>; Mon, 21 Sep 2020 23:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=H28rZwyuk612Q+lpk1xxhaA0RWkt3kwFSekiba8ihFE=;
 b=BNTL7CFbjq85ImK3WIt2do07sGw2Bl4V1i+bW/AEaFDo6tq0uo3qH3TpYKMmNkmYOT
 syuHyww8EC1HWKU+MlCWUzRI7WFAubp9gGy9uRAHGQhMlzVbeJ2f+HO20dHBPzq1CBQj
 DPkeypU4fFIzYzEI/MFKqefV4vqcC9p6Nqp1CDITYHb/+yOVOR/ctwlbzZiQmejdaXWN
 0jUDp5v0yaUSDDOJ5g9i8b8+ISCfINiu/Wr0xuPBx6NT2hhfeIWJmWs5it5/kXA5xzQb
 kSfDebRrCe3yIyTaWCAsmcceiZjNA2PP+Xp+OuDa7iRCOcV6m8A59mH9gAf581qs4qwr
 quzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=H28rZwyuk612Q+lpk1xxhaA0RWkt3kwFSekiba8ihFE=;
 b=KMNJz0KG8kIEiRaDZLQGReBqtoRUa1X+0MtRbuZtbDULVY9BLW50IjThQjVl01C70p
 l4KsIvJ/D2Pl+Dfh6sAGht1CLHoU3XZgHo6PW94rOmAyGRSr6JUyTIb2J4BxldGeZM/K
 plXkmfEyN2Gb8FGsj6O6yO/MuDD5TX82n24oFJ2TNZFgzYpG16prkCMErBnqUSqb/wcZ
 fVr7ukqM+6YXa1dafcPpKo8Jfagoz/9hTB67ZTs60ihZjp1VQWxcqFNW9h/VVyaligCK
 XKgWkgrkiDZ+KQuvVWm+m45z+RdhCzMtUYk1WqVEb/wAdajNW2F/Jr8qlh2QcjbIvJj+
 cXMQ==
X-Gm-Message-State: AOAM530kNjB4w+w9jX/RonGmHd0ciBDG9nNLvcftzfs/kWEDZCU/K7fv
 aX2uSCty/riU4V+il8hvaOg=
X-Google-Smtp-Source: ABdhPJyfw8Nl/Q3xJbsqSbwMLaScoWWOd4fXHBRKL688qNWWmA0geWMPpv3buGpT2Wi78aHY6jyFHg==
X-Received: by 2002:a63:fd08:: with SMTP id d8mr655202pgh.223.1600756965682;
 Mon, 21 Sep 2020 23:42:45 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.18])
 by smtp.gmail.com with ESMTPSA id t3sm1267350pje.43.2020.09.21.23.42.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Sep 2020 23:42:44 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Andrew Jeffery <andrew@aj.id.au>, James Feist <james.feist@linux.intel.com>
Subject: [PATCH] ARM: dts: aspeed: s2600wf: Fix VGA memory region location
Date: Tue, 22 Sep 2020 16:12:34 +0930
Message-Id: <20200922064234.163799-1-joel@jms.id.au>
X-Mailer: git-send-email 2.28.0
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
Cc: devicetree@vger.kernel.org, John Wang <wangzhiqiang.bj@bytedance.com>,
 linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

The VGA memory region is always from the top of RAM. On this board, that
is 0x80000000 + 0x20000000 - 0x01000000 = 0x9f000000.

This was not an issue in practice as the region is "reserved" by the
vendor's u-boot reducing the amount of available RAM, and the only user
is the host VGA device poking at RAM over PCIe. That is, nothing from
the ARM touches it.

It is worth fixing as developers copy existing device trees when
building their machines, and the XDMA driver does use the memory region
from the ARM side.

Fixes: c4043ecac34a ("ARM: dts: aspeed: Add S2600WF BMC Machine")
Reported-by: John Wang <wangzhiqiang.bj@bytedance.com>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/boot/dts/aspeed-bmc-intel-s2600wf.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-intel-s2600wf.dts b/arch/arm/boot/dts/aspeed-bmc-intel-s2600wf.dts
index 1deb30ec912c..6e9baf3bba53 100644
--- a/arch/arm/boot/dts/aspeed-bmc-intel-s2600wf.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-intel-s2600wf.dts
@@ -22,9 +22,9 @@ reserved-memory {
 		#size-cells = <1>;
 		ranges;
 
-		vga_memory: framebuffer@7f000000 {
+		vga_memory: framebuffer@9f000000 {
 			no-map;
-			reg = <0x7f000000 0x01000000>;
+			reg = <0x9f000000 0x01000000>; /* 16M */
 		};
 	};
 
-- 
2.28.0

