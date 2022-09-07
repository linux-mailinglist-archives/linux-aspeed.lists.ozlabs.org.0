Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 117765AFBE2
	for <lists+linux-aspeed@lfdr.de>; Wed,  7 Sep 2022 07:45:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MMrnP6xjVz3bXZ
	for <lists+linux-aspeed@lfdr.de>; Wed,  7 Sep 2022 15:45:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=YNxJIScs;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1032; helo=mail-pj1-x1032.google.com; envelope-from=rentao.bupt@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=YNxJIScs;
	dkim-atps=neutral
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MMrnD4FdSz2x9v
	for <linux-aspeed@lists.ozlabs.org>; Wed,  7 Sep 2022 15:45:02 +1000 (AEST)
Received: by mail-pj1-x1032.google.com with SMTP id q15-20020a17090a304f00b002002ac83485so9731798pjl.0
        for <linux-aspeed@lists.ozlabs.org>; Tue, 06 Sep 2022 22:45:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=jSw/8OWhZl8emStQst9ay10XSQWcoQ/kVcUGvAh1sIA=;
        b=YNxJIScsom9bak2HrRlByiNiWh+8luudX9NpkHoxt9LEXlos4S+VVpefAsKjRoIoSj
         8KvWvnC9m//L4RZ1j71qOMWcGKcdD2EAwVrPxqr8n9Y/1k6R6n9Ym9bCPIHpSwbiN+/E
         j+lo0AL9RCfxFunKj7zSrmfmqFTVWp3iC/+NUxwHI/cBDmmRQPXEzjNe229QC1UeSQZA
         0Bs1lIYeNz43/l3lQL42nsIxrED7VbLEaoRmZIMIPen29+hef3eSR8Qay5QOFkdRFKMr
         mrsmLhMJPXkAvHIWmZO69HgSUzZ5fPBd34hWlbHCcZXWxrHPU/dGm9SdGuOI/yE2Piep
         mBzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=jSw/8OWhZl8emStQst9ay10XSQWcoQ/kVcUGvAh1sIA=;
        b=avBq2JmU2jv/eHKgSy3tjrKtT2ntnJXm7x2Bexyco3MwyVzDqPEKQN99d4jFyavXMM
         coTcOTduFh1GaXVWsa8UPrttCFoCybFrltip3XvTK4ohBXaGde0gwxnabyPADhQyXfCw
         Nv6oBSNPGnCrvRhl5oCzYIdtoi1kqHJi42HTlnpIeCHAJjZOWEoedbzByz/WjpXDllL2
         /p+5gQDAV0j3Zz5s4P/5blFiz1+udVd50ABSJKTz2+8Y77edsxkq6wcytwKgqh5PPLzF
         CROW3KfksjmcZxiuIemeUC/0lsfTo7L719fI4XKPd8/RVx1duz/3M6bhqZm0THsmDiPr
         sM4Q==
X-Gm-Message-State: ACgBeo2Z8cwt2shcOHL/WdPCM9MT7NxuJXlYCwsd/Lyk4KfaHufmmghy
	9kP8k2MG6/9Xr4yJz2AapiE=
X-Google-Smtp-Source: AA6agR4BvSVDHcizdQDkcJB+aUoUijXpapQ45qqP8WG2juNShVwux9p94CzEVbm0sXkor79i5r2xdg==
X-Received: by 2002:a17:90b:33c5:b0:1fe:9dc:2b1b with SMTP id lk5-20020a17090b33c500b001fe09dc2b1bmr2153895pjb.211.1662529499795;
        Tue, 06 Sep 2022 22:44:59 -0700 (PDT)
Received: from localhost.localdomain ([76.132.249.1])
        by smtp.gmail.com with ESMTPSA id b2-20020a170902d50200b0016c0c82e85csm11222798plg.75.2022.09.06.22.44.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Sep 2022 22:44:59 -0700 (PDT)
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
Subject: [PATCH net-next v3 0/2] net: ftgmac100: support fixed link
Date: Tue,  6 Sep 2022 22:44:51 -0700
Message-Id: <20220907054453.20016-1-rentao.bupt@gmail.com>
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

 .../boot/dts/aspeed-bmc-facebook-elbert.dts   | 18 ++++++++++++++
 drivers/net/ethernet/faraday/ftgmac100.c      | 24 +++++++++++++++++++
 2 files changed, 42 insertions(+)

-- 
2.37.3

