Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8047398B049
	for <lists+linux-aspeed@lfdr.de>; Tue,  1 Oct 2024 00:45:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XHbkg5QKKz3fy9
	for <lists+linux-aspeed@lfdr.de>; Tue,  1 Oct 2024 08:45:31 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::72d"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727697898;
	cv=none; b=nu1q8+WQMpgr1lmpm+DdpVyfuHt7h8WXo70KHb9FLNQTWjalnyH74nBhiDelunOV8X3AAvMbanyAhxMF6dPgwGRUTEV2yENEzUyZiRRbdgZghPBqkUpO+5ih9iYGXavWdQThX34NdRxVGcY0n4Q7AN96OM54yB6fxHWAvp4un0eUK4mYmkRw+dbdzOVQMD79eAo6YoVzc0SKvRPC9+NO7YDsxbOqIpa0EoygLONRnNXXMnM4fv4r/jZ2vCRWxu/S11Kxbma5J7P178T4AWsr6nEsanfkiSWICeC5AF0QkSIrS5BvWYJ8FE+X41HsZWgJmmn16rG78tyJoRReEgJs4w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727697898; c=relaxed/relaxed;
	bh=4IxOY0fJQbV1pYrixFE+l++vJW3v3+bYS5tnnmoYTEc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EyutSBE7wrXvkhLh+G2PlInL/WoyEBWtWZjomBkyb4lMiA6ZUtM+BPwHJPh3Wt9VhqJdroT63L/sg/BtMZvSxoxXr7abPdljbn0prDTXZBoSfb5NoaNkKOcq1hpZ+abJiY4edpjHKeygcs3Qk1cucUPMRlXYyEl1JrFdl0J3X5QcoyRm0ou/l1SJLelPi3p4evTZ1TWvrk0xbLL3xgJRfN6SGryqgiSVWD2Pw5Ia3sI44J/jN1Soa9kwDcVLWmX8CnMAohHQmPug+MUVXXUySN7CTbl9ociqYeV5dvLiP9SPrjOsj6hqxybG7f6jrJ7Gm+zm8YQrdD9KSR5lu34VQA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=chromium.org; dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Rrpd44Ra; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::72d; helo=mail-qk1-x72d.google.com; envelope-from=ribalda@chromium.org; receiver=lists.ozlabs.org) smtp.mailfrom=chromium.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Rrpd44Ra;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::72d; helo=mail-qk1-x72d.google.com; envelope-from=ribalda@chromium.org; receiver=lists.ozlabs.org)
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com [IPv6:2607:f8b0:4864:20::72d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XHKWZ1s1sz2yZ6
	for <linux-aspeed@lists.ozlabs.org>; Mon, 30 Sep 2024 22:04:58 +1000 (AEST)
Received: by mail-qk1-x72d.google.com with SMTP id af79cd13be357-7a99eee4a5bso385247285a.0
        for <linux-aspeed@lists.ozlabs.org>; Mon, 30 Sep 2024 05:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727697895; x=1728302695; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4IxOY0fJQbV1pYrixFE+l++vJW3v3+bYS5tnnmoYTEc=;
        b=Rrpd44Ra5C5Xe2tjDC8apdKalhziNtC0Do8hacs3534qne4T1ii/8XDJPiBb2Nyw3f
         FClO5WF5mLapDoKy0lbjoS4rmq1lKDA+d/CrjR2vp1pXht2HR7dcs1M/fp8vx+og4kjS
         hEmASuOIaRQM63eHzYJM0E61z5UKRnKmiA7e4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727697895; x=1728302695;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4IxOY0fJQbV1pYrixFE+l++vJW3v3+bYS5tnnmoYTEc=;
        b=frEjB1DWm/a6WUJvfIgTsV8e65d2F1iufDeWhx5Zutf2dH5RM0MzMV66UcMNCKVgLL
         2SyH2EZAPPSTksfSX41Rw1oMHVTqeLsrkeYw3XchEfx9asb7AzFtfYFR2RDBYDr2YfwM
         plczyiDGNOEVp1evfY4K50HfaC2KkSeYe9g8pf1qMImi/ObnUTxXCvo9R8UdzaPQGqAK
         08AFgoB8h0r0es+6tJIUKhTbL08hiEzZVTOdzFuqXSbrBWDoML5GWxCmecWBMtDFOvYl
         9m3Lhl98DzrY52HMhpY46KqkDDXAMhqu8oHt1U3hHYWpx5nsIukemMuzdQlma2/pahzc
         XsXQ==
X-Forwarded-Encrypted: i=1; AJvYcCV8TXY2K88NdYE9nn94H1usNhdNMEpWYMU9Sscke/PUbzWyg7KfNDIoghxGMxZrlGD41I5+lS2FXSTaIQQ=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YznbTtDNmxZkdEeRa0mS7Hhb/wgm6bRjeJM+T6lKj+avqeVddSc
	vO61RBlQR/Zsx18fLsaFDey04mMEIh0YkirdaRVQf0V4DhAIoZJKwdhKf4SKgg==
X-Google-Smtp-Source: AGHT+IH66496SEOv3j8ygYtL4JJVB2nn5gkUmde7+6fS5LT2xRJFvFwOVG+MRgiMM8u5XXNXcxJVyg==
X-Received: by 2002:a05:6214:5b07:b0:6cb:5dd3:a3ce with SMTP id 6a1803df08f44-6cb5dd3a78emr68541006d6.14.1727697895340;
        Mon, 30 Sep 2024 05:04:55 -0700 (PDT)
Received: from denia.c.googlers.com (76.224.245.35.bc.googleusercontent.com. [35.245.224.76])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cb3b694369sm38822536d6.144.2024.09.30.05.04.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 05:04:54 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 30 Sep 2024 12:04:20 +0000
Subject: [PATCH 25/45] media: cobalt: Use string_choices helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240930-cocci-opportunity-v1-25-81e137456ce0@chromium.org>
References: <20240930-cocci-opportunity-v1-0-81e137456ce0@chromium.org>
In-Reply-To: <20240930-cocci-opportunity-v1-0-81e137456ce0@chromium.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Bingbu Cao <bingbu.cao@intel.com>, Tianshu Qiu <tian.shu.qiu@intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Hans de Goede <hdegoede@redhat.com>, Andy Shevchenko <andy@kernel.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>, Mike Isely <isely@pobox.com>, 
 Olli Salonen <olli.salonen@iki.fi>, 
 Maxim Levitsky <maximlevitsky@gmail.com>, Sean Young <sean@mess.org>, 
 Sergey Kozlov <serjk@netup.ru>, Abylay Ospan <aospan@netup.ru>, 
 Jemma Denson <jdenson@gmail.com>, 
 Patrick Boettcher <patrick.boettcher@posteo.de>, 
 Ming Qian <ming.qian@nxp.com>, Zhou Peng <eagle.zhou@nxp.com>, 
 Andy Walls <awalls@md.metrocast.net>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Michal Simek <michal.simek@amd.com>, 
 Jean-Christophe Trotin <jean-christophe.trotin@foss.st.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Eddie James <eajames@linux.ibm.com>, 
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Tomasz Figa <tfiga@chromium.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Tim Harvey <tharvey@gateworks.com>, 
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
 Sylvain Petinot <sylvain.petinot@foss.st.com>, 
 Jacopo Mondi <jacopo+renesas@jmondi.org>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
X-Mailer: b4 0.13.0
X-Spam-Status: No, score=-0.3 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailman-Approved-At: Tue, 01 Oct 2024 08:45:20 +1000
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
Cc: imx@lists.linux.dev, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

The following cocci warning is fixed:
drivers/media/pci/cobalt/cobalt-driver.c:263:25-33: opportunity for str_enable_disable(ctrl & 1)

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/pci/cobalt/cobalt-driver.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/pci/cobalt/cobalt-driver.c b/drivers/media/pci/cobalt/cobalt-driver.c
index 6e1a0614e6d0..cff2d29410d4 100644
--- a/drivers/media/pci/cobalt/cobalt-driver.c
+++ b/drivers/media/pci/cobalt/cobalt-driver.c
@@ -260,7 +260,7 @@ static void msi_config_show(struct cobalt *cobalt, struct pci_dev *pci_dev)
 	u32 adrs_l, adrs_h;
 
 	pci_read_config_word(pci_dev, 0x52, &ctrl);
-	cobalt_info("MSI %s\n", ctrl & 1 ? "enable" : "disable");
+	cobalt_info("MSI %s\n", str_enable_disable(ctrl & 1));
 	cobalt_info("MSI multiple message: Capable %u. Enable %u\n",
 		    (1 << ((ctrl >> 1) & 7)), (1 << ((ctrl >> 4) & 7)));
 	if (ctrl & 0x80)

-- 
2.46.1.824.gd892dcdcdd-goog

