Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B5AB98B03E
	for <lists+linux-aspeed@lfdr.de>; Tue,  1 Oct 2024 00:45:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XHbkb4Yxgz3ftG
	for <lists+linux-aspeed@lfdr.de>; Tue,  1 Oct 2024 08:45:27 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::736"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727697876;
	cv=none; b=OVkNIjIcBEve8B0+07dNLEqee4/kn0U7WxsGwPYoiC4/mcFEzBcw7j3S+lxLWQxakDPvYkIoOo7csPRPHxm5hJi9DsHmCcNBuP1e4slFsD1pJ0ZBcm937NETgRPY6AQrCS2bd61uK0ia5d+FQbCAvTU5g9tCUzJorgF6u+Qm9Dc6aQgA5T6YCVNyqdnuxvc8LuySjMQL2JATMg3osh0ddw2/MZKSAq7ruO5GYNM1BM+nIwLkdZQnAKXW6xjn2ZDb5UvY+hcbcQriTYnpJJlSJ86EakbwQ9E2LvygRDpzUu1EpfQkvKtG5l2VaRW7FQg4f2hx026I81+9ybaUqUzYHw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727697876; c=relaxed/relaxed;
	bh=ROQ1HhB5eUHGQkR1Zb9xX876/ICgPqUa0J3DMNQ2iR0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PajjYOWNWaF2kj4FcbItPHk6UEW/0hRCE8pQ91hznSFEO7y7jucSdAMWvrL/vKOjtN2PG7qBbwjdtUQTo35l/K8Ij3LPvkw2LP29jI0Ku5IFXMkeor03ijKPPYlhfd29u3fT9PJO8ROAvXhVp7Qv81b6XKD/UX8tSZWr5CsMoYBHu7VnjhXtfZ0LdHJLL2y7P+MOnBKLLgjbpvKKKpYWD/smhPBFBPWfNQ2fNDyLrHr2jxkkWGsX7At7k3xxGMfyYySLhvh2mjDSkHXZeL37YjyRcBICcArxLV70EIeHVdE1Nr7LU7N2TMJJU01PDI7dEO0qmVDvUsqhdYht+GddUA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=chromium.org; dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=DfBYOC8F; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::736; helo=mail-qk1-x736.google.com; envelope-from=ribalda@chromium.org; receiver=lists.ozlabs.org) smtp.mailfrom=chromium.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=DfBYOC8F;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::736; helo=mail-qk1-x736.google.com; envelope-from=ribalda@chromium.org; receiver=lists.ozlabs.org)
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com [IPv6:2607:f8b0:4864:20::736])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XHKW766Tbz2yPj
	for <linux-aspeed@lists.ozlabs.org>; Mon, 30 Sep 2024 22:04:35 +1000 (AEST)
Received: by mail-qk1-x736.google.com with SMTP id af79cd13be357-7ae3fcec5feso268753885a.0
        for <linux-aspeed@lists.ozlabs.org>; Mon, 30 Sep 2024 05:04:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727697873; x=1728302673; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ROQ1HhB5eUHGQkR1Zb9xX876/ICgPqUa0J3DMNQ2iR0=;
        b=DfBYOC8FiUujJ9bq6Xt6moxghOhkXZprJ4DhSU5VLLVzfPWjpMUz3QY+7WanG69695
         ObHM8oCRtrNhbcn2VxfaFcelS5xiVp7A+YwYB0slBBxLIs0eAo5Ph7ZNti2BIl0Oveqq
         +HOPHn97oHDUhCLgw51k2kF2II1niR2o1NfVE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727697873; x=1728302673;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ROQ1HhB5eUHGQkR1Zb9xX876/ICgPqUa0J3DMNQ2iR0=;
        b=nYnMrrICeoJCBfwljDI4jynJb0R+rq/l1cz3VJCbRuwsTUjWaVV40zxNys1kBtpSJn
         dpoyfYdLYM0F6LNoZbIJgNYiFRysDtQaFzZWIO6KrGWSynMdiRe5mMB+d8Xwxs2g0rw/
         vrtZ6JP92E8XsxxVMRqMEvynOQcKiw0MzDDQGWFxAl7PilTA0OG8sdsAsYV9YWa7MKNM
         RTVYPaZ1QrcfOXNX9RB0sODlSb8osJRPd4e8ynt2hpq8KeOJ/ENwp2sUmQuhEnaYyMda
         8ApEwocoH2Gpt4VtkKgAC79Gul/boOK4rcPXn6sNem2vxcKl8T/DajKkP/De/2nac8vP
         RCAQ==
X-Forwarded-Encrypted: i=1; AJvYcCU78bPHDqtoIazAc8621lAGFXwFXB+ny0D/GR6hnP0UEs59pnE98KQo/igu8Gxzu/Xh4M6/6IODq4fOhe4=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yx+2bmmQkon26H5Ckq3b6LnkF5yoVIz7a2xDZBDYn1DYa0fHAPq
	4R/tMzqETjekYXvkZTXwZpx/HwpRwTjfICTMA3C2neVTKbvX6QNOsKZ73X5/Ug==
X-Google-Smtp-Source: AGHT+IGlpLvOiABRGPfPC5tWhysrrPiJ2yte8Y1JxuD34Gtndo3CQ3SWzVD7Qrk2mRRfbUS2vxDpnw==
X-Received: by 2002:a05:6214:458d:b0:6c7:c63f:b414 with SMTP id 6a1803df08f44-6cb3b6407b6mr208576446d6.33.1727697872928;
        Mon, 30 Sep 2024 05:04:32 -0700 (PDT)
Received: from denia.c.googlers.com (76.224.245.35.bc.googleusercontent.com. [35.245.224.76])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cb3b694369sm38822536d6.144.2024.09.30.05.04.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 05:04:32 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 30 Sep 2024 12:04:09 +0000
Subject: [PATCH 14/45] media: saa7134: Use string_choices helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240930-cocci-opportunity-v1-14-81e137456ce0@chromium.org>
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

The following cocci warnings are fixed:
drivers/media/pci/saa7134/saa7134-cards.c:7984:7-16: opportunity for str_yes_no(( 1 == rc ))
drivers/media/pci/saa7134/saa7134-dvb.c:93:31-33: opportunity for str_on_off(ok)
drivers/media/pci/saa7134/saa7134-input.c:919:3-12: opportunity for str_yes_no(( rc == 1 ))
drivers/media/pci/saa7134/saa7134-input.c:898:3-12: opportunity for str_yes_no(( 1 == rc ))
drivers/media/pci/saa7134/saa7134-input.c:934:3-12: opportunity for str_yes_no(( 1 == rc ))
drivers/media/pci/saa7134/saa7134-video.c:622:10-15: opportunity for str_enabled_disabled(flags)

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/pci/saa7134/saa7134-cards.c | 2 +-
 drivers/media/pci/saa7134/saa7134-dvb.c   | 2 +-
 drivers/media/pci/saa7134/saa7134-input.c | 6 +++---
 drivers/media/pci/saa7134/saa7134-video.c | 2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/media/pci/saa7134/saa7134-cards.c b/drivers/media/pci/saa7134/saa7134-cards.c
index e80fb4ebfda6..79cd61fb0205 100644
--- a/drivers/media/pci/saa7134/saa7134-cards.c
+++ b/drivers/media/pci/saa7134/saa7134-cards.c
@@ -7981,7 +7981,7 @@ int saa7134_board_init2(struct saa7134_dev *dev)
 			rc = i2c_transfer(&dev->i2c_adap, &msg, 1);
 			pr_info("%s: probe IR chip @ i2c 0x%02x: %s\n",
 				   dev->name, msg.addr,
-				   (1 == rc) ? "yes" : "no");
+				   str_yes_no(rc == 1));
 			if (rc == 1)
 				dev->has_remote = SAA7134_REMOTE_I2C;
 		}
diff --git a/drivers/media/pci/saa7134/saa7134-dvb.c b/drivers/media/pci/saa7134/saa7134-dvb.c
index 6de8a02314af..d0e58a0156f7 100644
--- a/drivers/media/pci/saa7134/saa7134-dvb.c
+++ b/drivers/media/pci/saa7134/saa7134-dvb.c
@@ -90,7 +90,7 @@ static int pinnacle_antenna_pwr(struct saa7134_dev *dev, int on)
 	saa_setl(SAA7134_GPIO_GPSTATUS0 >> 2,   (1 << 28));
 	udelay(10);
 	ok = saa_readl(SAA7134_GPIO_GPSTATUS0) & (1 << 27);
-	pr_debug("%s %s\n", __func__, ok ? "on" : "off");
+	pr_debug("%s %s\n", __func__, str_on_off(ok));
 
 	if (!ok)
 		saa_clearl(SAA7134_GPIO_GPSTATUS0 >> 2,   (1 << 26));
diff --git a/drivers/media/pci/saa7134/saa7134-input.c b/drivers/media/pci/saa7134/saa7134-input.c
index 8610eb473b39..239f0b9d080a 100644
--- a/drivers/media/pci/saa7134/saa7134-input.c
+++ b/drivers/media/pci/saa7134/saa7134-input.c
@@ -895,7 +895,7 @@ void saa7134_probe_i2c_ir(struct saa7134_dev *dev)
 		rc = i2c_transfer(&dev->i2c_adap, &msg_msi, 1);
 		input_dbg("probe 0x%02x @ %s: %s\n",
 			msg_msi.addr, dev->i2c_adap.name,
-			(1 == rc) ? "yes" : "no");
+			str_yes_no(rc == 1));
 		break;
 	case SAA7134_BOARD_SNAZIO_TVPVR_PRO:
 		dev->init_data.name = "SnaZio* TVPVR PRO";
@@ -916,7 +916,7 @@ void saa7134_probe_i2c_ir(struct saa7134_dev *dev)
 		rc = i2c_transfer(&dev->i2c_adap, &msg_msi, 1);
 		input_dbg("probe 0x%02x @ %s: %s\n",
 			msg_msi.addr, dev->i2c_adap.name,
-			(rc == 1) ? "yes" : "no");
+			str_yes_no(rc == 1));
 		break;
 	case SAA7134_BOARD_KWORLD_PC150U:
 		/* copied and modified from MSI TV@nywhere Plus */
@@ -931,7 +931,7 @@ void saa7134_probe_i2c_ir(struct saa7134_dev *dev)
 		rc = i2c_transfer(&dev->i2c_adap, &msg_msi, 1);
 		input_dbg("probe 0x%02x @ %s: %s\n",
 			msg_msi.addr, dev->i2c_adap.name,
-			(1 == rc) ? "yes" : "no");
+			str_yes_no(rc == 1));
 		break;
 	case SAA7134_BOARD_HAUPPAUGE_HVR1110:
 		dev->init_data.name = saa7134_boards[dev->board].name;
diff --git a/drivers/media/pci/saa7134/saa7134-video.c b/drivers/media/pci/saa7134/saa7134-video.c
index 56b4481a40e6..1c02fb04abdf 100644
--- a/drivers/media/pci/saa7134/saa7134-video.c
+++ b/drivers/media/pci/saa7134/saa7134-video.c
@@ -619,7 +619,7 @@ static int saa7134_enable_analog_tuner(struct saa7134_dev *dev)
 		if (ret) {
 			pr_err("Couldn't change link %s->%s to %s. Error %d\n",
 			       source->name, sink->name,
-			       flags ? "enabled" : "disabled",
+			       str_enabled_disabled(flags),
 			       ret);
 			return ret;
 		}

-- 
2.46.1.824.gd892dcdcdd-goog

