Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC5AC5EEAFB
	for <lists+linux-aspeed@lfdr.de>; Thu, 29 Sep 2022 03:33:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MdG9G69KBz3bvs
	for <lists+linux-aspeed@lfdr.de>; Thu, 29 Sep 2022 11:33:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=kCd2f6Wl;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::431; helo=mail-pf1-x431.google.com; envelope-from=potin.lai.pt@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=kCd2f6Wl;
	dkim-atps=neutral
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MdG966ymyz2yWl
	for <linux-aspeed@lists.ozlabs.org>; Thu, 29 Sep 2022 11:33:46 +1000 (AEST)
Received: by mail-pf1-x431.google.com with SMTP id w2so160686pfb.0
        for <linux-aspeed@lists.ozlabs.org>; Wed, 28 Sep 2022 18:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=ZxQQLMUNaY7eMCarfGC4wOnU7JZ2k48wyRFxQNdExVs=;
        b=kCd2f6WlsfdYuM84nHXHWUYadYtZuAR1i1gDf59TYRQcNWRcDu9+/KnJg/Uk6cv0Iw
         MkhNOF2ITFL0bbWRHq+phwB5lVaaUtOgeQ5ix3EVwGsPzaT1f46UQdNxMwAYtZB75ARq
         s3CsEDUoHzQGInjkSqtuvSWiBX3ou9J8GHecBX9txhrQyX9afDNBZGgGswhZ9bV6IE33
         IH+ybP3J7Tq/CY9o90PjliIHiJ7iSfaiUbTRQqYZVsl8nDKJY+LY47HAW6qIUrpnfhjY
         gmS5YevMqwOEbBFJae427mshElrnatZCiXzXo+vlbTPRueBMPgWJoWsOIB2ia+I0knJb
         ZgDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=ZxQQLMUNaY7eMCarfGC4wOnU7JZ2k48wyRFxQNdExVs=;
        b=iuKTUdiPisuhfvFdNrc6JCCosKvSjfZBQjIadDwtiEmeQlIZilj130sMg4x/o/kPBh
         flU9xNVLOxuD/yCWXjj92uzJtvPIjc92GMmjhNGHJj5uWDaFYfWjCPFRlCchQ0hEYvhW
         vVK0GlJz7XUX2So3/ogQHv5Py+wxPKJTtrB7vHr5oGREBYqa8ZfJ0xPnDPDUXXRojsuh
         2bBtskRw2jdi/ZjeQKl+LiV+u31my0p3OwczqtxRYjoPxWQ0kB9H145AEz7Xhu/BxiZk
         gf0DZkWMIT7RjgJsYgRCSy6VwSJDA8p5RuQ8CK6EtZ+tYAlTlqxJteI9y+nw1LFHe8qq
         +qtg==
X-Gm-Message-State: ACrzQf0Phowl7f6O4Ie4+dpUW6IGMyT9RQ2hnCoZnFn5pUO/T2LiuoQf
	G1jWLKq3ru/uzxuCSXrfa7k=
X-Google-Smtp-Source: AMsMyM6OYWGO3w4kbWcMFzFaX3GeeKCuUgKS2uXZqekStmNfKYTEM0OyTiyM7RPJvIZhUPDuYt4cXw==
X-Received: by 2002:aa7:9801:0:b0:553:1bfb:9669 with SMTP id e1-20020aa79801000000b005531bfb9669mr941313pfl.15.1664415222945;
        Wed, 28 Sep 2022 18:33:42 -0700 (PDT)
Received: from localhost.localdomain (125-228-123-29.hinet-ip.hinet.net. [125.228.123.29])
        by smtp.gmail.com with ESMTPSA id w3-20020a170902ca0300b0016f85feae65sm4385587pld.87.2022.09.28.18.33.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Sep 2022 18:33:42 -0700 (PDT)
From: Potin Lai <potin.lai.pt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH 0/2] ARM: dts: aspeed: bletchley: Update Bletchley BMC devicetree
Date: Thu, 29 Sep 2022 09:31:28 +0800
Message-Id: <20220929013130.1916525-1-potin.lai.pt@gmail.com>
X-Mailer: git-send-email 2.31.1
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, Potin Lai <potin.lai@quantatw.com>, linux-kernel@vger.kernel.org, Potin Lai <potin.lai.pt@gmail.com>, Patrick Williams <patrick@stwcx.xyz>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Update Facebook Bletchley BMC devicetree base on Pre-PVT HW design.

Potin Lai (2):
  ARM: dts: aspeed: bletchley: update and fix gpio-line-names
  ARM: dts: aspeed: bletchley: enable emmc and ehci1

 .../boot/dts/aspeed-bmc-facebook-bletchley.dts   | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

-- 
2.31.1

