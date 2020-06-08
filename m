Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D1AC71F16E7
	for <lists+linux-aspeed@lfdr.de>; Mon,  8 Jun 2020 12:44:32 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49gVHc42jJzDqQd
	for <lists+linux-aspeed@lfdr.de>; Mon,  8 Jun 2020 20:44:28 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::444;
 helo=mail-pf1-x444.google.com; envelope-from=manikandan.hcl.ers.epl@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Nx4Nav7d; dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49gVHD3CpTzDqQd
 for <linux-aspeed@lists.ozlabs.org>; Mon,  8 Jun 2020 20:44:08 +1000 (AEST)
Received: by mail-pf1-x444.google.com with SMTP id a127so8349467pfa.12
 for <linux-aspeed@lists.ozlabs.org>; Mon, 08 Jun 2020 03:44:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition
 :user-agent; bh=qPnSozpEwUzkMm6eKHETr428FnuusYj7UAKssD/B8Gw=;
 b=Nx4Nav7dq7hqOTiO9EpgScp0uHZaMAEuO5ijNJXIiflFvXwujN6NzjfkgdrdObQXw7
 gtsUpoeP9gygnvCak/QpaFDOhAGY+6NMgrD2kko61NQGB+qM++yaROkDh316gvX5WJdD
 kVRcMIFl/HKLLX6DoSoFm3Obxjms1l649M3TvgERYYWDMSfhmM2lKBUX445KYxvraXay
 7/PcCFNkkUbHu37dfYBJcHam4Rh94zVC6XaDru1QTU+0+BKwmIv/KWK80cUDW8LZqAxx
 nk9gHUWLlS8tT+YCPxW4lCvbiX/SOYfP2F4rEG9L6hwwJGrJU0PmeqUHz3tLpV5CCA8q
 Gc5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=qPnSozpEwUzkMm6eKHETr428FnuusYj7UAKssD/B8Gw=;
 b=FVixfkr0OBKcAUeLS65VGD8eiwJD0D4tGxpKY8Qy5WsiXkOm/1TqPR05nCvtkOQhGF
 rhXU8N7Fc4z31QqE3WWrPeRoEqlN43qiS09CwsReWHQaNC+tWOvEWe+s5gIrJvllxBkG
 QmnSFBbAxTfFNtIJRRTXcuACTsAzQM4+cAuXcxcE/Oh4WbHKrL2ZvBxzg5CsiAj4rtps
 GLBz3ylMqdgTgBjS8HP2jy3g3mId2wQqonxEQ+WM2wlCCI4bpYyvkzX8NqoxNoLVJdmT
 vSEt8nVNBK0SPoFG/SYZSojy7eUqDoIcPJZP8UpUg5qDXhqlv5a5949GixcCq2QSHTU6
 KoMQ==
X-Gm-Message-State: AOAM532+0sGEmGDoWRuu4Dpxr3tD4u6jzhjNzaOda1ie3wernuYTfdcg
 iyrf/Cue3cFfn2639qaRfbA=
X-Google-Smtp-Source: ABdhPJxgls+P5umjn5ZAfKcl9HEToSKCZ+YAzvgO/qv6hSZewDYAKVnQCujNvqqB9DaDgbuDvUQ/+g==
X-Received: by 2002:a63:63c4:: with SMTP id
 x187mr20800156pgb.112.1591613044363; 
 Mon, 08 Jun 2020 03:44:04 -0700 (PDT)
Received: from cnn ([2401:4900:2349:e80d:cd72:839f:5826:c552])
 by smtp.gmail.com with ESMTPSA id dw17sm14808774pjb.40.2020.06.08.03.44.00
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 08 Jun 2020 03:44:03 -0700 (PDT)
Date: Mon, 8 Jun 2020 16:13:49 +0530
From: Manikandan Elumalai <manikandan.hcl.ers.epl@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>, Jean Delvare <jdelvare@suse.com>,
 linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3] hwmon:(adm1275) Enable adm1278 ADM1278_TEMP1_EN
Message-ID: <20200608104349.GA10918@cnn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.5.24 (2015-08-30)
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
Cc: manikandan.e@hcl.com, saipsdasari@fb.com, patrickw3@fb.com,
 linux-aspeed@lists.ozlabs.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

The adm1278 temp attribute need it for openbmc platform .
This feature not enabled by default, so PMON_CONFIG needs to enable it.

v3:
----
fix invalid signed-off.
removed checkpath warnings.
write ADM1278_TEMP1_EN and ADM1278_VOUT_EN conf in single line operation.

v2:
----
add Signed-off-by.
removed ADM1278_TEMP1_EN check.

Signed-off-by: Manikandan Elumalai <manikandan.hcl.ers.epl@gmail.com>
---
 drivers/hwmon/pmbus/adm1275.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/hwmon/pmbus/adm1275.c b/drivers/hwmon/pmbus/adm1275.c
index 5caa37fb..4782e31 100644
--- a/drivers/hwmon/pmbus/adm1275.c
+++ b/drivers/hwmon/pmbus/adm1275.c
@@ -666,11 +666,12 @@ static int adm1275_probe(struct i2c_client *client,
 		tindex = 3;
 
 		info->func[0] |= PMBUS_HAVE_PIN | PMBUS_HAVE_STATUS_INPUT |
-			PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT;
+			PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT |
+			PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP;
 
-		/* Enable VOUT if not enabled (it is disabled by default) */
+		/* Enable VOUT & TEMP1 if not enabled (disabled by default) */
 		if (!(config & ADM1278_VOUT_EN)) {
-			config |= ADM1278_VOUT_EN;
+			config |= ADM1278_VOUT_EN | ADM1278_TEMP1_EN;
 			ret = i2c_smbus_write_byte_data(client,
 							ADM1275_PMON_CONFIG,
 							config);
@@ -681,9 +682,6 @@ static int adm1275_probe(struct i2c_client *client,
 			}
 		}
 
-		if (config & ADM1278_TEMP1_EN)
-			info->func[0] |=
-				PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP;
 		if (config & ADM1278_VIN_EN)
 			info->func[0] |= PMBUS_HAVE_VIN;
 		break;
-- 
2.7.4

