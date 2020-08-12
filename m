Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ADC34242897
	for <lists+linux-aspeed@lfdr.de>; Wed, 12 Aug 2020 13:24:28 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BRS5g5w1lzDqXW
	for <lists+linux-aspeed@lfdr.de>; Wed, 12 Aug 2020 21:24:23 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::543;
 helo=mail-pg1-x543.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=ecicS9VZ; dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BRS5W6whvzDqVW
 for <linux-aspeed@lists.ozlabs.org>; Wed, 12 Aug 2020 21:24:15 +1000 (AEST)
Received: by mail-pg1-x543.google.com with SMTP id p37so896036pgl.3
 for <linux-aspeed@lists.ozlabs.org>; Wed, 12 Aug 2020 04:24:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9+WajxCq7gTYxJQxz4BklwsXaVQmRwBfSGv+L76EXJk=;
 b=ecicS9VZv9HYbYw5uW+HOhpoCA9mG7Ds4jcUUcSnWo5LW+O4JdKS6cZm7EBb0sl8pZ
 fotKQKF8sYohP++PnzDYZLiwdW99f9JgWLtuwcMPRP8loDiqQquYoVgTNUcy3m/EN73h
 HB7hoLWLYYAluZcW3T7FbXZRorvMJ4A6TPaYvQLwa7pJixKtgE3ZKlvuBKBxiDfflLSw
 xP7uguGcCwWjxoVIawi9/zme1lugd3mOu4dvnmedoQeqJdrl/VpTTGouMerEKnd/mnpF
 v9Re5+eYIx+jYsF+RgjRgbzxzNQBp4tGvvuxLKgRbBD1ogY9CcfjQLgdjtFtOxQ1IsMv
 lKBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=9+WajxCq7gTYxJQxz4BklwsXaVQmRwBfSGv+L76EXJk=;
 b=khKKA3xHEmw+2XpC/WXshlGN1dCokukJ4hcCFfyu+UOoG2/NR2mqTPVx0Fu7M4fpZ4
 AqqVQAmLsNcn6/HrY0s36HMzSTPIo2Oie3pZzDZnTpv0cIngvKV6w+92VEz9JJF2yQv3
 QN3TipaMdjiuFyib2Bdkd0IPHU/EclTgi377cLcnKuAQSGkzbe4JfD1c4XJihxzccp4N
 cgyDUeGDOz+tu3kOYPh/CKlE+RXGvUJ1rLd4NjlDkEfxyfkGc30DsnHuP7giw9o5bcjQ
 joCS8tTYplOdBvQZv31RPc7aNSjupEdvv4SF44e14P11CbPTj+xpkHBNuUELarHZgO7J
 k3TQ==
X-Gm-Message-State: AOAM530vIxLDviPr3ur8988IGpP0gEbzz4DIxg5EjcvBiX5ivES3Eo+w
 TYPNvXmylbiybWEcM6jLRfI=
X-Google-Smtp-Source: ABdhPJyAxGGCmZs1UUyztQFKQGC3+UREwAgvsOBRFVJ8aUZLNMAttG/s9j8yZKTMOkwbSiThNxWDgg==
X-Received: by 2002:aa7:8c56:: with SMTP id e22mr10200501pfd.238.1597231452333; 
 Wed, 12 Aug 2020 04:24:12 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.19])
 by smtp.gmail.com with ESMTPSA id m19sm2081536pgd.21.2020.08.12.04.24.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Aug 2020 04:24:10 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Oskar Senft <osk@google.com>,
	Jeremy Kerr <jk@ozlabs.org>
Subject: [PATCH] ARM: aspeed: g5: Do not set sirq polarity
Date: Wed, 12 Aug 2020 20:54:00 +0930
Message-Id: <20200812112400.2406734-1-joel@jms.id.au>
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
Cc: stable@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

A feature was added to the aspeed vuart driver to configure the vuart
interrupt (sirq) polarity according to the LPC/eSPI strapping register.

Systems that depend on a active low behaviour (sirq_polarity set to 0)
such as OpenPower boxes also use LPC, so this relationship does not
hold.

The property was added for a Tyan S7106 system which is not supported
in the kernel tree. Should this or other systems wish to use this
feature of the driver they should add it to the machine specific device
tree.

Fixes: c791fc76bc72 ("arm: dts: aspeed: Add vuart aspeed,sirq-polarity-sense...")
Cc: stable@vger.kernel.org
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/boot/dts/aspeed-g5.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-g5.dtsi
index 27e5c5cf7712..664630a0e084 100644
--- a/arch/arm/boot/dts/aspeed-g5.dtsi
+++ b/arch/arm/boot/dts/aspeed-g5.dtsi
@@ -410,7 +410,6 @@ vuart: serial@1e787000 {
 				interrupts = <8>;
 				clocks = <&syscon ASPEED_CLK_APB>;
 				no-loopback-test;
-				aspeed,sirq-polarity-sense = <&syscon 0x70 25>;
 				status = "disabled";
 			};
 
-- 
2.28.0

