Return-Path: <linux-aspeed+bounces-665-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BDC8FA29CE1
	for <lists+linux-aspeed@lfdr.de>; Wed,  5 Feb 2025 23:51:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YpFpB5krVz2yDH;
	Thu,  6 Feb 2025 09:51:14 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738786215;
	cv=none; b=MG8xQTJiDjt2xV63ExDMJP/9/xq1idcy07VnAnoXBiqyqBnHl4mcZrcaRuV7OVYrvbNmpoGbYo2fprMSVbhHY8i6Bw8LFmie1Xfbo+EEHatJLz8U/0FplTQkBaNfgttaNDi82L0HmnlCsZVNlYU8W/dqdfJRkXgE+2M5hZDBxXV4gY76QdvsRhjHBUPMjxDUr0OxYyKllNye3EtcqA8D9Qcb5lGMEWduSMRq/5i1Ch1tO6k/hbu5CIAHAdyzF0dTuqQ3eqvkJMOpxjsl7VVaBnf9bb18LdtZRALkGBEKqy4u+EC5ujXmP2jWB3pZmRTqrsrUeCZXtTLnIC4JZcOrLw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738786215; c=relaxed/relaxed;
	bh=OOJO4gc/B+VHUdBaesnMxetPUuR8LvhMIAVa1+IoQu4=;
	h=From:Date:Subject:MIME-Version:Message-Id:References:In-Reply-To:
	 To:Cc:Content-Type; b=C59qOPVOq/j8RdDVX5E4f0ITZQApQXfFC+p2QGS4eolvKd1Tayq9VSl8x6vyboFa6CWV3Z97zE4QZDZ9UYkaBIMM4iG0riIiIFWZbSSZPewpDnClVMqlnA5idSPglCP83tnU7HOC9J0+0i1T+JWd62CfrV3IqSbn/6mTCUsvp13E+UYQ5s/k9Vd7fFRPK7qM/0EAPkomqeBqD6LqzLS3I2VCZ8iIngtTcTT+fl4iM5TAFeo1wDJF6vjyOW2wVe9U1voLs/bHAhCtBrPMAr24Lq/g5iWh6S3DqhVt+e4OQQL22SQ1injjIQJ85G4zJS9ZZsw2+e2k7tkkVyFLxlMI2Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WZlTMLIY; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=D9N3BIhO; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=asrivats@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WZlTMLIY;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=D9N3BIhO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=asrivats@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YpBDQ6sTkz3011
	for <linux-aspeed@lists.ozlabs.org>; Thu,  6 Feb 2025 07:10:14 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738786211;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OOJO4gc/B+VHUdBaesnMxetPUuR8LvhMIAVa1+IoQu4=;
	b=WZlTMLIYdNdkbIrA2YymN/UP4msF6/VtVe/nAgO+qxdzuz6hNdXRqnCxoPYoGMJWhW3Zvb
	vqpXaLAn4BXnrYcbtpunyfFBEn8MXTJjtgbIWJPYpr0zk1TW47zkx//MTbYXXMVfCwuQEc
	dXbKlyBx0eKyZOxEpJNOIEaQbyFZRY8=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738786212;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OOJO4gc/B+VHUdBaesnMxetPUuR8LvhMIAVa1+IoQu4=;
	b=D9N3BIhO1RHdujmPF2kDprTwWpdq8kcpV5nghCMh4qOl+LTJxae3fpNRfT197CD2JIgXxO
	WHeWPx4WS1JqekyNB8n2nQPyLvgL21/t7XmK/lN5f//jNBWlr3x84dAtGX2tVAyAC0gDxX
	ycKUwvst6gsp0V/iTsl+kLGQCeyx5Vs=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-10-VYKDWJafPH-VyoV7Qf35Uw-1; Wed,
 05 Feb 2025 15:10:10 -0500
X-MC-Unique: VYKDWJafPH-VyoV7Qf35Uw-1
X-Mimecast-MFC-AGG-ID: VYKDWJafPH-VyoV7Qf35Uw
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 8543719560A6;
	Wed,  5 Feb 2025 20:10:02 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.17.21])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 9FCFE19560AF;
	Wed,  5 Feb 2025 20:09:51 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Wed, 05 Feb 2025 15:08:00 -0500
Subject: [PATCH 04/12] drm/mediatek: move to
 devm_platform_ioremap_resource() usage
X-Mailing-List: linux-aspeed@lists.ozlabs.org
List-Id: <linux-aspeed.lists.ozlabs.org>
List-Help: <mailto:linux-aspeed+help@lists.ozlabs.org>
List-Owner: <mailto:linux-aspeed+owner@lists.ozlabs.org>
List-Post: <mailto:linux-aspeed@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linux-aspeed/>,
  <https://lists.ozlabs.org/pipermail/linux-aspeed/>
List-Subscribe: <mailto:linux-aspeed+subscribe@lists.ozlabs.org>,
  <mailto:linux-aspeed+subscribe-digest@lists.ozlabs.org>,
  <mailto:linux-aspeed+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linux-aspeed+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Message-Id: <20250205-mem-cocci-newapi-v1-4-aebf2b0e2300@redhat.com>
References: <20250205-mem-cocci-newapi-v1-0-aebf2b0e2300@redhat.com>
In-Reply-To: <20250205-mem-cocci-newapi-v1-0-aebf2b0e2300@redhat.com>
To: Joel Stanley <joel@jms.id.au>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Stefan Agner <stefan@agner.ch>, Alison Wang <alison.wang@nxp.com>, 
 Xinliang Liu <xinliang.liu@linaro.org>, Tian Tao <tiantao6@hisilicon.com>, 
 Xinwei Kong <kong.kongxinwei@hisilicon.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 Yongqin Liu <yongqin.liu@linaro.org>, John Stultz <jstultz@google.com>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Marek Vasut <marex@denx.de>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, 
 Alain Volmat <alain.volmat@foss.st.com>, 
 Raphael Gallais-Pou <rgallaispou@gmail.com>, 
 Yannick Fertre <yannick.fertre@foss.st.com>, 
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, 
 Philippe Cornu <philippe.cornu@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Mikko Perttunen <mperttunen@nvidia.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Alexey Brodkin <abrodkin@synopsys.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: linux-aspeed@lists.ozlabs.org, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, imx@lists.linux.dev, 
 linux-rockchip@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, linux-tegra@vger.kernel.org, 
 linux-doc@vger.kernel.org, Anusha Srivatsa <asrivats@redhat.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738786137; l=8685;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=gaN5bJDrpd5isCfkjzOID9ayJIdjOxeGWmWcCy/9kzE=;
 b=0gfVdfxGwiEcvFlm/cdX7S5NTjoS7jEAqhe2Db/J7t0CgEpbppqG3fmT8PKknuWA2klzTan1Z
 8nrQnMJFkJCCeFCbyf5W66EznEfN9iVpQByBnQ5/CcFOKXl/Rc6mfqE
X-Developer-Key: i=asrivats@redhat.com; a=ed25519;
 pk=brnIHkBsUZEhyW6Zyn0U92AeIZ1psws/q8VFbIkf1AU=
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: bKxyXCYDURHEveGXM2iSobyHAg2LIs3hpFIZtoFJLIw_1738786203
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Replace platform_get_resource + devm_ioremap_resource
with just devm_platform_ioremap_resource()

Used Coccinelle to do this change. SmPl patch:
@rule_1@
identifier res;
expression ioremap_res;
identifier pdev;
@@
-struct resource *res;
...
-res = platform_get_resource(pdev,...);
-ioremap_res = devm_ioremap_resource(...);
+ioremap_res = devm_platform_ioremap_resource(pdev,0);

Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_color.c | 4 +---
 drivers/gpu/drm/mediatek/mtk_disp_gamma.c | 4 +---
 drivers/gpu/drm/mediatek/mtk_disp_merge.c | 4 +---
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c   | 4 +---
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c  | 4 +---
 drivers/gpu/drm/mediatek/mtk_dsi.c        | 4 +---
 drivers/gpu/drm/mediatek/mtk_hdmi.c       | 4 +---
 drivers/gpu/drm/mediatek/mtk_mdp_rdma.c   | 4 +---
 8 files changed, 8 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_color.c b/drivers/gpu/drm/mediatek/mtk_disp_color.c
index dd8433a38282a9ba1bcc3a4ddd01dd89738ccb60..39c7de4cdcc16b56a5a1d046aaabaf5580227ed2 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_color.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_color.c
@@ -96,7 +96,6 @@ static int mtk_disp_color_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct mtk_disp_color *priv;
-	struct resource *res;
 	int ret;
 
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
@@ -108,8 +107,7 @@ static int mtk_disp_color_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(priv->clk),
 				     "failed to get color clk\n");
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	priv->regs = devm_ioremap_resource(dev, res);
+	priv->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(priv->regs))
 		return dev_err_probe(dev, PTR_ERR(priv->regs),
 				     "failed to ioremap color\n");
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
index b17b11d93846f2019d8c4afb294375333e22dc42..8afd15006df2a21f3f52fe00eca3c5501f4fb76a 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
@@ -256,7 +256,6 @@ static int mtk_disp_gamma_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct mtk_disp_gamma *priv;
-	struct resource *res;
 	int ret;
 
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
@@ -268,8 +267,7 @@ static int mtk_disp_gamma_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(priv->clk),
 				     "failed to get gamma clk\n");
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	priv->regs = devm_ioremap_resource(dev, res);
+	priv->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(priv->regs))
 		return dev_err_probe(dev, PTR_ERR(priv->regs),
 				     "failed to ioremap gamma\n");
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_merge.c b/drivers/gpu/drm/mediatek/mtk_disp_merge.c
index 563b1b248fbbb38ef03bb3e3ceecdd265961df60..b174dda091d3fbd16796e8e128b030fccf5b902c 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_merge.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_merge.c
@@ -306,7 +306,6 @@ static const struct component_ops mtk_disp_merge_component_ops = {
 static int mtk_disp_merge_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct resource *res;
 	struct mtk_disp_merge *priv;
 	int ret;
 
@@ -314,8 +313,7 @@ static int mtk_disp_merge_probe(struct platform_device *pdev)
 	if (!priv)
 		return -ENOMEM;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	priv->regs = devm_ioremap_resource(dev, res);
+	priv->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(priv->regs))
 		return dev_err_probe(dev, PTR_ERR(priv->regs),
 				     "failed to ioremap merge\n");
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
index df82cea4bb79c472acbb66e0df27fbad3e70bd20..d0581c4e3c999cf865fdd0aaf4c2f38dd404926e 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
@@ -604,7 +604,6 @@ static int mtk_disp_ovl_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct mtk_disp_ovl *priv;
-	struct resource *res;
 	int irq;
 	int ret;
 
@@ -621,8 +620,7 @@ static int mtk_disp_ovl_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(priv->clk),
 				     "failed to get ovl clk\n");
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	priv->regs = devm_ioremap_resource(dev, res);
+	priv->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(priv->regs))
 		return dev_err_probe(dev, PTR_ERR(priv->regs),
 				     "failed to ioremap ovl\n");
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
index bf47790e4d6be5d60070c63c15c75fa201cc4b27..c9d41d75e7f2a3af5820921b7e563da377ce8d0d 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
@@ -313,7 +313,6 @@ static int mtk_disp_rdma_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct mtk_disp_rdma *priv;
-	struct resource *res;
 	int irq;
 	int ret;
 
@@ -330,8 +329,7 @@ static int mtk_disp_rdma_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(priv->clk),
 				     "failed to get rdma clk\n");
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	priv->regs = devm_ioremap_resource(dev, res);
+	priv->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(priv->regs))
 		return dev_err_probe(dev, PTR_ERR(priv->regs),
 				     "failed to ioremap rdma\n");
diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index 40752f2320548fbf6c7de96b18e8a636ac9c31be..f298293471de49473dd05973383dc22f7d3b6c23 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -1192,7 +1192,6 @@ static int mtk_dsi_probe(struct platform_device *pdev)
 {
 	struct mtk_dsi *dsi;
 	struct device *dev = &pdev->dev;
-	struct resource *regs;
 	int irq_num;
 	int ret;
 
@@ -1217,8 +1216,7 @@ static int mtk_dsi_probe(struct platform_device *pdev)
 	if (IS_ERR(dsi->hs_clk))
 		return dev_err_probe(dev, PTR_ERR(dsi->hs_clk), "Failed to get hs clock\n");
 
-	regs = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	dsi->regs = devm_ioremap_resource(dev, regs);
+	dsi->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(dsi->regs))
 		return dev_err_probe(dev, PTR_ERR(dsi->regs), "Failed to ioremap memory\n");
 
diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
index ca82bc829cb96446d4d34eeef45848df03bd716b..d729c13590cb5ec176f15b680c262a26b677e6aa 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
@@ -1425,7 +1425,6 @@ static int mtk_hdmi_dt_parse_pdata(struct mtk_hdmi *hdmi,
 	struct device_node *cec_np, *remote, *i2c_np;
 	struct platform_device *cec_pdev;
 	struct regmap *regmap;
-	struct resource *mem;
 	int ret;
 
 	ret = mtk_hdmi_get_all_clk(hdmi, np);
@@ -1471,8 +1470,7 @@ static int mtk_hdmi_dt_parse_pdata(struct mtk_hdmi *hdmi,
 	}
 	hdmi->sys_regmap = regmap;
 
-	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	hdmi->regs = devm_ioremap_resource(dev, mem);
+	hdmi->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(hdmi->regs)) {
 		ret = PTR_ERR(hdmi->regs);
 		goto put_device;
diff --git a/drivers/gpu/drm/mediatek/mtk_mdp_rdma.c b/drivers/gpu/drm/mediatek/mtk_mdp_rdma.c
index fc69ee38ce7d6a245a7460cfde8de426e83b2e80..7982788ae9df51f1a378d8d538737f38af7299f2 100644
--- a/drivers/gpu/drm/mediatek/mtk_mdp_rdma.c
+++ b/drivers/gpu/drm/mediatek/mtk_mdp_rdma.c
@@ -291,7 +291,6 @@ static const struct component_ops mtk_mdp_rdma_component_ops = {
 static int mtk_mdp_rdma_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct resource *res;
 	struct mtk_mdp_rdma *priv;
 	int ret = 0;
 
@@ -299,8 +298,7 @@ static int mtk_mdp_rdma_probe(struct platform_device *pdev)
 	if (!priv)
 		return -ENOMEM;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	priv->regs = devm_ioremap_resource(dev, res);
+	priv->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(priv->regs))
 		return dev_err_probe(dev, PTR_ERR(priv->regs),
 				     "failed to ioremap rdma\n");

-- 
2.47.0


