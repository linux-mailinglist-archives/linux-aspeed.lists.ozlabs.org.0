Return-Path: <linux-aspeed+bounces-3735-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cCQ0Mg51wGnvHwQAu9opvQ
	(envelope-from <linux-aspeed+bounces-3735-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>)
	for <lists+linux-aspeed@lfdr.de>; Mon, 23 Mar 2026 00:02:38 +0100
X-Original-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A9F392EB1C2
	for <lists+linux-aspeed@lfdr.de>; Mon, 23 Mar 2026 00:02:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ffBf20Bwbz2ySW;
	Mon, 23 Mar 2026 10:02:34 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::334"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1774220553;
	cv=none; b=bNvo+11Bk9TmG93VQ2BSZNQ1IA0zNHUTtQyB4geU3bPJX59HzvGVPe3Xhox67Hb703tkR4/E3KvlPWijdSPHijCwMLYV0iQsNycFXK+QyOWDJgm4TN84q6OB3U57c9yaLTUsChLB6m+RPRcrmMcYurL5SQjum+lgLE7XOUF1A6X1KA+Mz1C48S7fx/cF5IKrT4el9WFb/Afsu4up46otu7qB3Aim2apkJPlgiyfFoTkNnL/WlaN3+ZMEOMWwGPyFV/ge29KegHxR0rGCJ+BxmyIoffUL5fwnEwPq1GJdMub9iR29hLkR1EH+maPU4ehYqkIzVuGOtWW4ldrLQQXnXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1774220553; c=relaxed/relaxed;
	bh=kU0acvfqOp1dQM/3PUz94K3T5EGGl6FMD6BKWt5VIr0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YC3ESIAwcjwmZLp4G2t7P5o9HTDnL7BLMBfYweTH+/FL2dwthzjzzky+7l8/KpSlNjd+Io8tIOM0+JcicbUnDcs6QgH03TI60ttYQBXa1nczPBdLfkJuyjiJlRQdbsjCLzkH4vXkZGFaRMOiDB81R1oisLlVJm0gAoGHGz9gWD4hzyfWdvkVEsyXiSqqhhtXUfbiOk5q3QUces+p8Ckc9i6Jm5tjnEAa9NoMmoirLPTVx4dgN7wepUS6otEp8aqiylfV2PtmTc6VX/ZBLxl8UR2gi6K/blZQsAisHNGUntKVUJJHsrd1mjirQJufoEvLlYBB16M84gWNCr4E2SdKiQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=G4NuTnrW; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com; envelope-from=julianbraha@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=G4NuTnrW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com; envelope-from=julianbraha@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ffBf03RJ3z2xQ1
	for <linux-aspeed@lists.ozlabs.org>; Mon, 23 Mar 2026 10:02:31 +1100 (AEDT)
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-48558d6ef83so20835925e9.3
        for <linux-aspeed@lists.ozlabs.org>; Sun, 22 Mar 2026 16:02:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774220547; x=1774825347; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=kU0acvfqOp1dQM/3PUz94K3T5EGGl6FMD6BKWt5VIr0=;
        b=G4NuTnrWr7FuUk6KH7ZSBu/83xrxeOCnGNiZc0EiTJZKVB/iRu5bGgVoUBV1kSphi4
         QZEYIX5Mriapk/l0+PuJ4qpmlRiUSsnSA3onimTJdIYqNIR0z+plE92rmU1W61ZtpWcg
         D2wxtkmWv9IKUx7t80aDgUpURA7VZDjQJNcKXFFoI+Yn1r4xZSgMBm59xWwvbKfT9MfE
         QHMOOSjKzc0ZZ/RQEIICqEPz1xqpUc2E9v4gQmzsLfMw1cjPGRdy/oiPS/PKzdFu0wFr
         W8kqJ91+ekC/kPlZYdaP47k7D4sNqEwJjkUCH1qqB9xrHyIi2ALU67a5rvsTYk5BiHJZ
         +XHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774220547; x=1774825347;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kU0acvfqOp1dQM/3PUz94K3T5EGGl6FMD6BKWt5VIr0=;
        b=USRHsFD5FG+OtVtLz2DN57/Y0ybnBpJBKS3ArJTdW9fcCMPURC/HOEFxaJPkJeEudF
         7hnuy30NA+lyK8BTI/hbmfx8ij/FZ/a+LsI6vElcE+HWA/sN8ULv4sbHYiMN6rQX24z4
         M21qblggK8ozq9CdI5HqM5RevjC7JsfptWNlE6XAfSSUoHeBkDJ7WK+OAcUGn9+HfGEB
         NnY47P0slnFJwRKNBNI0VDYgAEQs735mzMK2iQL14uZ9K+4OVV5RPdG++YSnr2Zs/dTh
         WSoU68fHlnsB3zvTZYCcjosOynRRygBF/rJb+uAqeJ+Wp4S/hJOaFz6eceMYWO3w04ew
         pzXA==
X-Forwarded-Encrypted: i=1; AJvYcCVEX1TWbh5RmFtbUyLuKh4XP3WMqDBjVmpv8bb0CG8ilVPO/0M+9Fl0+n0c/naQqOlPujmM/QPj+SjJmOI=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwWsMKaivQym4DlHGy4ktsTrWEj2mGHBBIqumYGsQ983Zufn1Jg
	YgiFfDS1/OE7K2eZPfHN+GXauO6IP+jyePqJxA2ugsAv/5zef0ppASAd
X-Gm-Gg: ATEYQzwDTsXDT4SnxR2qbtTMkmOqbYJjfY/XozUIBGdMcaIeuIxjqfq5UU65oQ6J6o+
	lRZVb9/0XJ97mY9plIyf4Jbhoy96mRRa7ZraHf5eNh50p8DjPCNwPOn4dJrpCvjUpgpAqNvSoQv
	3j5oMrsFgNk/CqkJqI0BGFrQu93fNqnx0HJaB0vi2PYQYKeOgaojwllel1A1ogSIKoW7fiS411w
	QaN8d6Q1Dl1ntCpLvJzEpEH6cUDdU3lc0OdCTQEBL5Ku0HhvctGnk2A5qK93tr2rrBaoeEHTw7I
	lHQHN/OV5AvkpvRaTDR7kvhOfXYPF8PLtsOorn28yPNF9vaedFWiTORTip3CkhHz9pFdhKE8Lyq
	Ueq56Rkd2AlR3/LEYCrMH3miEFFMKXJYUZTapVSvJ2DdIZoir8xDoYLWUKa3fQ4PfAmjfoQ736z
	cd6qRWXqWQPkNh1bmtBp7avXpWfrll/9cU9DZcLy7clRbc7vni9VsegkA=
X-Received: by 2002:a05:600c:4705:b0:485:3a86:6392 with SMTP id 5b1f17b1804b1-486fee0d816mr141768745e9.20.1774220547399;
        Sun, 22 Mar 2026 16:02:27 -0700 (PDT)
Received: from nixos-office (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486fc4d90f4sm325617155e9.1.2026.03.22.16.02.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 16:02:26 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
From: Julian Braha <julianbraha@gmail.com>
To: joel@jms.id.au,
	andrew@codeconstruct.com.au
Cc: linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Julian Braha <julianbraha@gmail.com>
Subject: [PATCH] soc: aspeed: cleanup dead default for ASPEED_SOCINFO
Date: Sun, 22 Mar 2026 23:02:23 +0000
Message-ID: <20260322230223.1393885-1-julianbraha@gmail.com>
X-Mailer: git-send-email 2.51.2
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
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Spamd-Result: default: False [-0.71 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:joel@jms.id.au,m:andrew@codeconstruct.com.au,m:linux-arm-kernel@lists.infradead.org,m:linux-aspeed@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:julianbraha@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[julianbraha@gmail.com,linux-aspeed@lists.ozlabs.org];
	FORWARDED(0.00)[linux-aspeed@lists.ozlabs.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-3735-lists,linux-aspeed=lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCPT_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[linux-aspeed@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[julianbraha@gmail.com,linux-aspeed@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[lists.infradead.org,lists.ozlabs.org,vger.kernel.org,gmail.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-aspeed];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: A9F392EB1C2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The same kconfig 'default' statement appears twice for ASPEED_SOCINFO,
which is unnecessary.

This dead code was found by kconfirm, a static analysis tool for Kconfig.

Signed-off-by: Julian Braha <julianbraha@gmail.com>
---
 drivers/soc/aspeed/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/soc/aspeed/Kconfig b/drivers/soc/aspeed/Kconfig
index f579ee0b5afa..63a656449a1a 100644
--- a/drivers/soc/aspeed/Kconfig
+++ b/drivers/soc/aspeed/Kconfig
@@ -46,7 +46,6 @@ config ASPEED_P2A_CTRL
 
 config ASPEED_SOCINFO
 	bool "ASPEED SoC Information driver"
-	default ARCH_ASPEED
 	select SOC_BUS
 	default ARCH_ASPEED
 	help
-- 
2.51.2


