Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 41813AFC55
	for <lists+linux-aspeed@lfdr.de>; Wed, 11 Sep 2019 14:16:40 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46T19071PPzF36C
	for <lists+linux-aspeed@lfdr.de>; Wed, 11 Sep 2019 22:16:36 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::441; helo=mail-pf1-x441.google.com;
 envelope-from=rashmica.g@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="T+AzYIEU"; 
 dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46NYRG5fJfzDqlV
 for <linux-aspeed@lists.ozlabs.org>; Wed,  4 Sep 2019 16:13:30 +1000 (AEST)
Received: by mail-pf1-x441.google.com with SMTP id y72so4963133pfb.12
 for <linux-aspeed@lists.ozlabs.org>; Tue, 03 Sep 2019 23:13:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/J2boyPn+qcY/K0vnmvhFTTJFIHHHtzjypsfGFGhgdk=;
 b=T+AzYIEUXfUowK7oaDioOyQfgljXCgF5OaLeVOZDs5si9YNS62iHvZYF7QPPWxoMuD
 6HZoj9lzZMst3evVF0QG+nXAFRWyTTfNe+b4E+h9aBaBl8CaInKHf+pZGjQktMzzlEyS
 HPNpOSDNvBsS1d0T59kOyxX0yOuiQVzLIo1D/hymPSUPqgY+ZFRe3b3dSJPdOMgWbONz
 XvbCScG2k/yOAyjE4AfT144iEbaku+wFeuwj856zrB+uPkd+g7LsFBwlQVtZxyT5dwXx
 hb3V4Ke7j/tgHPb2wYdr0vtUMJXXvKhK8Lz9SZ5Ad7ed0rq0j23lIoyWDfziHTJgqVtW
 vamg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/J2boyPn+qcY/K0vnmvhFTTJFIHHHtzjypsfGFGhgdk=;
 b=pdzHDhxaJv7W+41T1iLGvqENNQWP4F9bep5Hz+as4Amk1z1Mo4uNg9vtu37pAETl7t
 he9skUeMeNkGVk6cuz8VAVlegXpNTfarT1fvFn+I7tNAhyVHbksUitW99+juFdxJj8SN
 TWnWjifj+7vGio86zsCBCX9FiwTBMXr7ekgmx6mnI4NXzdonf9oeyHfRJiCCsO0pTfPt
 8d/iGtQGUqZ1w/ks8PCRjfCfRGdnsrOf9abNNU/e9ClkJzm76mTAKGoaAY0mlrCMTSg5
 MvaZxGWHGwYDERhOp0MBWlu0qnNivcQKnfP/noYvrJLTaSc6yXoUit9T7OiXaKSRHdnf
 b/bg==
X-Gm-Message-State: APjAAAXjdasgJIercj7D2j1gs2dExE8cV6q4jeETeCblxn3zbwPCO61T
 IqLoqnK7S8br01a0jObYsek=
X-Google-Smtp-Source: APXvYqx0ThSaW+fHUBqyw3dqUD0Oa30Gmx83hxepmA1ZcStILNrjdla4WSXq4PxIDnAoPGKQ4jNvJQ==
X-Received: by 2002:a65:5a8c:: with SMTP id c12mr32988229pgt.73.1567577609134; 
 Tue, 03 Sep 2019 23:13:29 -0700 (PDT)
Received: from rashmica.ozlabs.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id i9sm42443093pgo.46.2019.09.03.23.13.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2019 23:13:28 -0700 (PDT)
From: Rashmica Gupta <rashmica.g@gmail.com>
To: linus.walleij@linaro.org, linux-gpio@vger.kernel.org,
 bgolaszewski@baylibre.com
Subject: [PATCH 4/4] gpio: Update documentation with ast2600 controllers
Date: Wed,  4 Sep 2019 16:12:45 +1000
Message-Id: <20190904061245.30770-4-rashmica.g@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190904061245.30770-1-rashmica.g@gmail.com>
References: <20190904061245.30770-1-rashmica.g@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 11 Sep 2019 22:16:16 +1000
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
Cc: linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Signed-off-by: Rashmica Gupta <rashmica.g@gmail.com>
---
 Documentation/devicetree/bindings/gpio/gpio-aspeed.txt | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/gpio/gpio-aspeed.txt b/Documentation/devicetree/bindings/gpio/gpio-aspeed.txt
index 7e9b586770b0..cd388797e07c 100644
--- a/Documentation/devicetree/bindings/gpio/gpio-aspeed.txt
+++ b/Documentation/devicetree/bindings/gpio/gpio-aspeed.txt
@@ -2,7 +2,8 @@ Aspeed GPIO controller Device Tree Bindings
 -------------------------------------------
 
 Required properties:
-- compatible		: Either "aspeed,ast2400-gpio" or "aspeed,ast2500-gpio"
+- compatible		: Either "aspeed,ast2400-gpio", "aspeed,ast2500-gpio",
+					  "aspeed,ast2600-gpio", or "aspeed,ast2600-1-8v-gpio"
 
 - #gpio-cells 		: Should be two
 			  - First cell is the GPIO line number
-- 
2.20.1

