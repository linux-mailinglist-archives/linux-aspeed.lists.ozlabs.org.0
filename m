Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A5E8F5ADFA8
	for <lists+linux-aspeed@lfdr.de>; Tue,  6 Sep 2022 08:20:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MMFcn4NCtz3bXn
	for <lists+linux-aspeed@lfdr.de>; Tue,  6 Sep 2022 16:20:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=AB50cPp4;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1029; helo=mail-pj1-x1029.google.com; envelope-from=rentao.bupt@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=AB50cPp4;
	dkim-atps=neutral
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MMFch1HqJz2xKV
	for <linux-aspeed@lists.ozlabs.org>; Tue,  6 Sep 2022 16:20:35 +1000 (AEST)
Received: by mail-pj1-x1029.google.com with SMTP id fv3so4120148pjb.0
        for <linux-aspeed@lists.ozlabs.org>; Mon, 05 Sep 2022 23:20:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=delLkvjT8PCP+Ncz2RgacJbjqYhQsYq5ByGTAUQohKI=;
        b=AB50cPp4YWn/0IYxLsU/3B3UTojp/d4KXUj/q1xX6JS2ZseKmIvcJZjRvv3kqLo6NA
         l+8eaRrkN7ElsC6NsnpcFQH/rKPYmIDOg8ypvlYzo39naFopoGuK7ONUjYZN4fVBX9ni
         QhWmQzlWjFV0t3wXlxdMXRkrr20u5+DLae/EIFKFzHFjFeOsDRpLHj9qjejFNya70bcc
         XBaN3+H+/KQU8Bgs0nafT0roBxNRvX/umh801T99OaOZ1ssmYI8vS+zUo2Vb9g/QCVHg
         JLrOeK0FttAPYuqXDHy7pFJ4E8rPgkTsOeEMyRkIWmzAbzKF7JbV6Jz6H2RfDQ3lM30r
         k6Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=delLkvjT8PCP+Ncz2RgacJbjqYhQsYq5ByGTAUQohKI=;
        b=z0+mJsElZhc3RRIXVOjPGmrGfhNnbBupupz8IMDJECXFbJLw/BuurqpwOM3OKUOhVJ
         QB+MK3jHDzLfx2lhFi/bcw5YL7dlrKZOkWrZB8J3Yj9VEjku3THxNCASjpPougIYJDjX
         hhWdmpfdR7TRbazO5A3w+V6ROvME7fJZfRN7w8GHi3m5mr8EE5FuVxFJ/48fuKKTu8ke
         qcbNkaUZg02NTtGpEhkaHpiKXX+b9ctLu766ez4/I7uopk21j0WKh0r08wT/k+WUpuxE
         LRTsXpkg9KjGRavWcOCKJbStezrgoot73Eh2R8csZf7RWqWiWGZUmszm+WuPmMksylEE
         USdQ==
X-Gm-Message-State: ACgBeo1//51m5cEf/A1RtQEDUThorQ1Vh7lXR5+r5ir0333/ifLJiiET
	qc2IvkpmgBe0tXtjTHDLTVg=
X-Google-Smtp-Source: AA6agR5U9d9xHuCBeBjB3Bsy0w5WuyL0CxOpnm27siaJBDHBM6cwNBK8dAAtaDTNDXunhC/T34P3IA==
X-Received: by 2002:a17:903:110e:b0:171:3afa:e68c with SMTP id n14-20020a170903110e00b001713afae68cmr51767140plh.12.1662445233400;
        Mon, 05 Sep 2022 23:20:33 -0700 (PDT)
Received: from localhost.localdomain ([76.132.249.1])
        by smtp.gmail.com with ESMTPSA id m16-20020a170902db1000b00172dd10f64fsm8877798plx.263.2022.09.05.23.20.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Sep 2022 23:20:32 -0700 (PDT)
From: rentao.bupt@gmail.com
To: Andrew Lunn <andrew@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Heyi Guo <guoheyi@linux.alibaba.com>,
	Dylan Hung <dylan_hung@aspeedtech.com>,
	Guangbin Huang <huangguangbin2@huawei.com>,
	Liang He <windhl@126.com>,
	Hao Chen <chenhao288@hisilicon.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>,
	Tao Ren <taoren@fb.com>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v2 0/2] net: ftgmac100: support fixed link
Date: Mon,  5 Sep 2022 23:20:24 -0700
Message-Id: <20220906062026.57169-1-rentao.bupt@gmail.com>
X-Mailer: git-send-email 2.37.3
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
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

From: Tao Ren <rentao.bupt@gmail.com>

The patch series adds fixed link support to ftgmac100 driver.

Patch #1 adds fixed link logic into ftgmac100 driver.

Patch #2 enables mac3 controller in Elbert dts: Elbert mac3 is connected
to the onboard switch BCM53134P's IMP_RGMII port directly (no PHY
between BMC MAC and BCM53134P).

Tao Ren (2):
  net: ftgmac100: support fixed link
  ARM: dts: aspeed: elbert: Enable mac3 controller

 .../boot/dts/aspeed-bmc-facebook-elbert.dts   | 20 ++++++++++++++++
 drivers/net/ethernet/faraday/ftgmac100.c      | 24 +++++++++++++++++++
 2 files changed, 44 insertions(+)

-- 
2.37.3

