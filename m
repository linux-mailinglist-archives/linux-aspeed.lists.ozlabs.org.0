Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E9D25ADC11
	for <lists+linux-aspeed@lfdr.de>; Tue,  6 Sep 2022 01:57:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MM5634DK9z306r
	for <lists+linux-aspeed@lfdr.de>; Tue,  6 Sep 2022 09:56:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=jwQ7xjGR;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::436; helo=mail-pf1-x436.google.com; envelope-from=rentao.bupt@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=jwQ7xjGR;
	dkim-atps=neutral
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MM55w5hwjz2xHC
	for <linux-aspeed@lists.ozlabs.org>; Tue,  6 Sep 2022 09:56:50 +1000 (AEST)
Received: by mail-pf1-x436.google.com with SMTP id y127so9759685pfy.5
        for <linux-aspeed@lists.ozlabs.org>; Mon, 05 Sep 2022 16:56:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date;
        bh=yG2nsd5/34KZh2Ljv+YOVUI4bCWzz44qCZZJaZQXcIE=;
        b=jwQ7xjGRpjqZBJX0RitfI2JOv3JRzOaCEou9RQnxmEomm8uZkMG+4mu9e+sPoJpI/L
         /lI6ZAMYDXGUtEyUSquoiaqZ+j1EKewkC5I2uOv+awexiajeL93T1UaVNVLmQBVYVrcb
         bnBzAuCji5LGJgQ1WCuR497gA9WwQVeuAqDyenytoOnGB5ZenLYmUXenXyyieaQAZfil
         zjJg5QC5T+P7cojQyNL9yIOPLHXjmiwj2pzHdaXv/SJ79CQk4dM7bIOG0lZMPPvO6F6B
         7Fc4Q6Ca3Wsqoo5JHdHgoa+f5cxDB0wu7E5n0IDkzKrk4CMcSqsOrfnouX5d0SJKgam+
         vWaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date;
        bh=yG2nsd5/34KZh2Ljv+YOVUI4bCWzz44qCZZJaZQXcIE=;
        b=d1FrTtHZ1BusJ9vtqRJnN6UEu6WNa0kCT/C/LaKLF2z74FsvS12xLMFtFDqYpsRwtq
         1a1BmH0EsQYcskMzmmLFIUM28mesesGTzUpe3v5xWQlns4eD/9Nf57NAq9YQuIbd58UD
         tFo2JlvAQDw+oux+zzJPWfThmuLFuZhFsR+91WAI8TT+eGJlgLhLO/ZfjlCq9JOolGpq
         165M0XbrcfQbGaoiLI/SMpaEljMS71FvWzUWDy5lDZAaYY8pWCXg9k/kOpUD+W2yB+Cg
         DlJ7C4Y3iUmj4CsS1xpU+6h++S6k9YNXT5jrOh5wmf+qYpD4jz9ptdIBR1EUsmTtSMBs
         zj3g==
X-Gm-Message-State: ACgBeo32byWXqvxhZRyMwtqjxLA0XUJ2zW1CeYEQny7wUw1GmD3SDOtE
	CbXKS+IrGOqwoIWcGGmg7xY=
X-Google-Smtp-Source: AA6agR6AyDvPMSYp2d+Sum7aE/V0wjZupDIJx2E1mWHPq7oRrMlI7aTHTfXVrD6sMl2K6TZXzSB7Pg==
X-Received: by 2002:a05:6a00:88a:b0:53a:b7a0:ea3a with SMTP id q10-20020a056a00088a00b0053ab7a0ea3amr29406689pfj.21.1662422206546;
        Mon, 05 Sep 2022 16:56:46 -0700 (PDT)
Received: from localhost.localdomain ([76.132.249.1])
        by smtp.gmail.com with ESMTPSA id g26-20020aa79dda000000b00537f13d217bsm8405530pfq.76.2022.09.05.16.56.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Sep 2022 16:56:45 -0700 (PDT)
From: rentao.bupt@gmail.com
To: "David S . Miller" <davem@davemloft.net>,
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
Subject: [PATCH net-next 0/2] net: ftgmac100: support fixed link
Date: Mon,  5 Sep 2022 16:56:32 -0700
Message-Id: <20220905235634.20957-1-rentao.bupt@gmail.com>
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

From: Tao Ren <taoren@fb.com>

The patch series adds fixed link support to ftgmac100 driver.

Patch #1 adds fixed link logic into ftgmac100 driver.

Patch #2 enables mac3 controller in Elbert dts, and mac3 is connected to
the onboard switch directly.

Tao Ren (2):
  net: ftgmac100: support fixed link
  ARM: dts: aspeed: elbert: Enable mac3 controller

 .../boot/dts/aspeed-bmc-facebook-elbert.dts   | 11 +++++++++
 drivers/net/ethernet/faraday/ftgmac100.c      | 24 +++++++++++++++++++
 2 files changed, 35 insertions(+)

-- 
2.30.2

