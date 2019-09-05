Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C0DC5AA68A
	for <lists+linux-aspeed@lfdr.de>; Thu,  5 Sep 2019 16:53:36 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46PNwt0YNszDr2w
	for <lists+linux-aspeed@lfdr.de>; Fri,  6 Sep 2019 00:53:34 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (mailfrom)
 smtp.mailfrom=flex--osk.bounces.google.com (client-ip=2607:f8b0:4864:20::849;
 helo=mail-qt1-x849.google.com;
 envelope-from=3ph5xxqmkdjkhld9hh9e7.5hfebgnq-3li776eblml.hse34l.hk9@flex--osk.bounces.google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="kFQCO+IL"; 
 dkim-atps=neutral
Received: from mail-qt1-x849.google.com (mail-qt1-x849.google.com
 [IPv6:2607:f8b0:4864:20::849])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46PNqg1YF8zDqTY
 for <linux-aspeed@lists.ozlabs.org>; Fri,  6 Sep 2019 00:49:03 +1000 (AEST)
Received: by mail-qt1-x849.google.com with SMTP id c13so2723851qtp.21
 for <linux-aspeed@lists.ozlabs.org>; Thu, 05 Sep 2019 07:49:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=DBIgduCaugj8tqfaD9C0q1cOrYEMjHp+EVVP9xE+eQU=;
 b=kFQCO+ILTxycGD0xPpwoQ2n/kJ3/gIMamkdeAtF5gZONEcygdv6B8viIrHbUn7pAn1
 jsPrQfi+A5AUgpFzxVSBgYJY+wfn8U1b00aSKG/0puFKN9MDOdDuM3TRK06qBA8pViHf
 S3SVzRuVjVk+odURthKdo7VMqFnql4/SSn7EuZJhMyOedA76sMhZuNiTvFoQ5UOBXjTT
 dciBZ4RasmNWXIUULCEW+v9XFRolhBz3ew/8kAyesPCTnhxFhST6joqcANAAr6gi7w25
 aWy9TL/ETCspFPHhrreos5OCONl4Om8cu9vActrASMUIPHSt/+I4NnxIm7a/CUywGlAI
 Mf0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=DBIgduCaugj8tqfaD9C0q1cOrYEMjHp+EVVP9xE+eQU=;
 b=dag1XUFc6joqk4uIAUdyHMrwAYvb5FA6MTh36IMoGUP6EXbC9CGWROD5VjEtqfk9Cd
 /Dhjh4BUCL8W4HfE7x1qXQi1/4XStNyybMxLTH5VksRie0TWfSQ7qj6rm05ROk7YUnPF
 DacUDPQ6chxsyKUXN3ppywyMB0qyjqLHfHqfQ6hIzCKZaGPnfPmbQHmjgtk9XBcp9fQc
 vK6Y2GvryChafQ88eQ+1zrwZA2oomcxYUBbUbnrxtUEbHXD6K6J32237ctv30jCSYL0O
 BY3h5Hxhy4gBMBiAj3Wt0BVIfV74xB/KEP3ekMM1ppz4D+XXFL2uVly4lh8th5YuViY/
 XIFg==
X-Gm-Message-State: APjAAAWfZUna8inDq+BQ69KcHiMTJR/f3x5A/UTt+JXmnsiFQ3HarqOA
 LcDR1P9Njc8KglLCqExRRIOdvrc=
X-Google-Smtp-Source: APXvYqyNSVOy6oyG9DD0QBvBuTaufZmFloO9JVWmWZHMU1JZn5mMUAwUE7z3OJooXuAyecAHfFp7wjQ=
X-Received: by 2002:ac8:130d:: with SMTP id e13mr2670110qtj.287.1567694502968; 
 Thu, 05 Sep 2019 07:41:42 -0700 (PDT)
Date: Thu,  5 Sep 2019 10:41:30 -0400
In-Reply-To: <20190905144130.220713-1-osk@google.com>
Message-Id: <20190905144130.220713-3-osk@google.com>
Mime-Version: 1.0
References: <20190905144130.220713-1-osk@google.com>
X-Mailer: git-send-email 2.23.0.187.g17f5b7556c-goog
Subject: [PATCH v3 3/3] arm: dts: aspeed: Add vuart aspeed, sirq-polarity-sense
 to aspeed-g5.dtsi
From: Oskar Senft <osk@google.com>
To: joel@jms.id.au, andrew@aj.id.au, robh+dt@kernel.org, 
 gregkh@linuxfoundation.org, jk@ozlabs.org
Content-Type: text/plain; charset="UTF-8"
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
Cc: devicetree@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-serial@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 Oskar Senft <osk@google.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Enable auto-configuration of VUART SIRQ polarity on AST2500.

Signed-off-by: Oskar Senft <osk@google.com>
---
 arch/arm/boot/dts/aspeed-g5.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-g5.dtsi
index 5b1ca265c2ce..06e489c1d0cb 100644
--- a/arch/arm/boot/dts/aspeed-g5.dtsi
+++ b/arch/arm/boot/dts/aspeed-g5.dtsi
@@ -351,6 +351,7 @@
 				interrupts = <8>;
 				clocks = <&syscon ASPEED_CLK_APB>;
 				no-loopback-test;
+				aspeed,sirq-polarity-sense = <&syscon 0x70 25>;
 				status = "disabled";
 			};
 
-- 
2.23.0.187.g17f5b7556c-goog

