Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 12E8626BF86
	for <lists+linux-aspeed@lfdr.de>; Wed, 16 Sep 2020 10:40:41 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BrtpZ0YB9zDqBZ
	for <lists+linux-aspeed@lfdr.de>; Wed, 16 Sep 2020 18:40:38 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1043;
 helo=mail-pj1-x1043.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=MlmerPIq; dkim-atps=neutral
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BrtgT4771zDqNR
 for <linux-aspeed@lists.ozlabs.org>; Wed, 16 Sep 2020 18:34:29 +1000 (AEST)
Received: by mail-pj1-x1043.google.com with SMTP id a9so1210416pjg.1
 for <linux-aspeed@lists.ozlabs.org>; Wed, 16 Sep 2020 01:34:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vcKxZphnJRmQ71TIoliF/aQqaJ43RnyH3JVqst80hzY=;
 b=MlmerPIqUhxTvZFzwst6kBbKun5we9SveOnWePFa45PYAFh/Vti+wbUkXBSLkfOrq2
 g/lKhHx/ar0xPs8myAu/r9z5KqH1THnE6g/Sdj7Tef0Ms5kEWcGepxPDFJdW7awiM6wx
 YNM2sDdG9yGU0hzZ96nOQxrL+/wC5xGykSEDArB/tnQV1v+FwVq0qoGieza1eXFC1AxZ
 Py+NPbvAFv4+7C5OnKeG3WYms87LkgIfHadkyt/q54JYYgWdrGGTUvsZjXFIYewoVSaV
 uefDkxAsnP3AbbP1jORnCQ3pNNkYJQWJXPwFBKKNCYEOtXUFo7GnsrbsVijgy2ii3niW
 qI2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=vcKxZphnJRmQ71TIoliF/aQqaJ43RnyH3JVqst80hzY=;
 b=qr4FKS0qFiAgRF358tqw21yB2QjULRqt276QcV+CxL18v9GLCwlKQm1PZXHk3bYHKv
 U4j0saHt98vyF/TZXvNpclTyq+ce9tyRdPO1Sq+m74SHWDZ3uYRZBTyI/ShAiPwxjALW
 PiqdOzvw7IfIFTk+UXWwPtT/EFOd2+XRufVGsOQmAZS2lmA0KWIO6YvdzqAbQQs6VBlY
 mU3relNPw0x8eRdO4pP6pDeuvd6Qtv3UM7K/B6rOd2KSYMjm+PA5+AOP3mJKzsldV5uc
 fONuLe1T1ZwstgCpzA1yOX6jGi4ev+fbwO5ygSOuLIvOvVlzvlutCKQuq6jGDTqVtz4m
 vlHg==
X-Gm-Message-State: AOAM5314bi42/E7uuMYMiqxYHmlHrc4FkgSTvpfyPsDgQ3KBbP7ikKmn
 RHOYpAi04j03qwtY95dpn5k=
X-Google-Smtp-Source: ABdhPJzzWAP3ZfSvWviU9rH+tjW3d5iTK3iLmx4IbOy+KeeGv/o8U159fEb6jML5S5XeJGB1VcgxZg==
X-Received: by 2002:a17:90a:e02:: with SMTP id v2mr2950760pje.6.1600245263856; 
 Wed, 16 Sep 2020 01:34:23 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.18])
 by smtp.gmail.com with ESMTPSA id fz22sm1858130pjb.46.2020.09.16.01.34.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Sep 2020 01:34:22 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH] drm/aspeed: Add sysfs for output settings
Date: Wed, 16 Sep 2020 18:04:13 +0930
Message-Id: <20200916083413.777307-1-joel@jms.id.au>
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
Cc: linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-aspeed@lists.ozlabs.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

These settings are used by an ASPEED BMC to determine when the host is
trying to drive the display over PCIe (vga_pw) and to switch the
output between PCIe and the internal graphics device (dac_mux).

The valid values for the dac mux are:

 00: VGA mode (default, aka PCIe)
 01: Graphics CRT (aka BMC internal graphics, this driver)
 10: Pass through mode from video input port A
 11: Pass through mode from video input port B

Values for the read-only vga password register are:

 1: Host driving the display
 0: Host not driving the display

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 drivers/gpu/drm/aspeed/aspeed_gfx_drv.c | 71 +++++++++++++++++++++++++
 1 file changed, 71 insertions(+)

diff --git a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
index 903f4f304647..9e06a3683f8a 100644
--- a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
+++ b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
@@ -205,6 +205,69 @@ static const struct of_device_id aspeed_gfx_match[] = {
 	{ }
 };
 
+#define ASPEED_SCU_VGA0		0x50
+#define ASPEED_SCU_MISC_CTRL	0x2c
+
+static ssize_t dac_mux_store(struct device *dev, struct device_attribute *attr,
+			     const char *buf, size_t count)
+{
+	struct aspeed_gfx *priv = dev_get_drvdata(dev);
+	u32 val;
+	int rc;
+
+	rc = kstrtou32(buf, 0, &val);
+	if (rc)
+		return rc;
+
+	if (val < 0 || val > 3)
+		return -EINVAL;
+
+	rc = regmap_update_bits(priv->scu, ASPEED_SCU_MISC_CTRL, 0x30000, val << 16);
+	if (rc < 0)
+		return 0;
+
+	return count;
+}
+
+static ssize_t dac_mux_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	struct aspeed_gfx *priv = dev_get_drvdata(dev);
+	u32 reg;
+	int rc;
+
+	rc = regmap_read(priv->scu, ASPEED_SCU_MISC_CTRL, &reg);
+	if (rc)
+		return rc;
+
+	return sprintf(buf, "%u\n", (reg >> 16) & 0x3);
+}
+static DEVICE_ATTR_RW(dac_mux);
+
+static ssize_t
+vga_pw_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	struct aspeed_gfx *priv = dev_get_drvdata(dev);
+	u32 reg;
+	int rc;
+
+	rc = regmap_read(priv->scu, ASPEED_SCU_VGA0, &reg);
+	if (rc)
+		return rc;
+
+	return sprintf(buf, "%u\n", reg & 1);
+}
+static DEVICE_ATTR_RO(vga_pw);
+
+static struct attribute *aspeed_sysfs_entries[] = {
+	&dev_attr_vga_pw.attr,
+	&dev_attr_dac_mux.attr,
+	NULL,
+};
+
+static struct attribute_group aspeed_sysfs_attr_group = {
+	.attrs = aspeed_sysfs_entries,
+};
+
 static int aspeed_gfx_probe(struct platform_device *pdev)
 {
 	struct aspeed_gfx *priv;
@@ -219,6 +282,12 @@ static int aspeed_gfx_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	dev_set_drvdata(&pdev->dev, priv);
+
+	ret = sysfs_create_group(&pdev->dev.kobj, &aspeed_sysfs_attr_group);
+	if (ret)
+		return ret;
+
 	ret = drm_dev_register(&priv->drm, 0);
 	if (ret)
 		goto err_unload;
@@ -227,6 +296,7 @@ static int aspeed_gfx_probe(struct platform_device *pdev)
 	return 0;
 
 err_unload:
+	sysfs_remove_group(&pdev->dev.kobj, &aspeed_sysfs_attr_group);
 	aspeed_gfx_unload(&priv->drm);
 
 	return ret;
@@ -236,6 +306,7 @@ static int aspeed_gfx_remove(struct platform_device *pdev)
 {
 	struct drm_device *drm = platform_get_drvdata(pdev);
 
+	sysfs_remove_group(&pdev->dev.kobj, &aspeed_sysfs_attr_group);
 	drm_dev_unregister(drm);
 	aspeed_gfx_unload(drm);
 
-- 
2.28.0

