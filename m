Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 38873693F3B
	for <lists+linux-aspeed@lfdr.de>; Mon, 13 Feb 2023 08:57:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PFcBk07HVz3bW0
	for <lists+linux-aspeed@lfdr.de>; Mon, 13 Feb 2023 18:57:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ufispace-com.20210112.gappssmtp.com header.i=@ufispace-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=LwZ/sKRz;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ufispace.com (client-ip=2607:f8b0:4864:20::42f; helo=mail-pf1-x42f.google.com; envelope-from=jordan.chang@ufispace.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ufispace-com.20210112.gappssmtp.com header.i=@ufispace-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=LwZ/sKRz;
	dkim-atps=neutral
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PFcBd1cBNz2x9J
	for <linux-aspeed@lists.ozlabs.org>; Mon, 13 Feb 2023 18:57:29 +1100 (AEDT)
Received: by mail-pf1-x42f.google.com with SMTP id n2so7353926pfo.3
        for <linux-aspeed@lists.ozlabs.org>; Sun, 12 Feb 2023 23:57:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ufispace-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tHJhiuRiqcFrsMSI4ugI2BOz+NSM+ro+gE1w6zVpdyI=;
        b=LwZ/sKRzDFxjgmVtGLG6VES6M86sDeHn1sB1X609wpG94R/o0z9PEfDEvOkk+WSM9U
         R6B08yRzbGXdnhC/dNtXoug6mH0k4y4QI4FkMIqE5ytFvA0Cwhx7/2CIhYXPaje/d1Tq
         6U+jWY258loP6HwtfH9SmYIMY+v63CQHHzz3xVb2/MhGWYRXUx8ZQWS2tP3T/TndSuAT
         sv5hycb+JIt/Ygnk6IuEj3BH/We8dhnSbtLdT2XcCnfzl/dYuDSmS6Lxs7OAwjO3dhC0
         jaWQyBTo3qMDR/940X93jTILihyUfybzXE3TUkwViPGPC4O1dWPb/nj+JHn0GF47E510
         cYtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tHJhiuRiqcFrsMSI4ugI2BOz+NSM+ro+gE1w6zVpdyI=;
        b=YAvhyhOQsJAmby+UUT+SObmoYrrUJSGnW1NBDHm+te3dE1VV0s1/b/n8tojjmYArvM
         aULYy/8mfwoJ8pXcnaa4OSXxb+BDM2q2ba0AO9iE/aB8/lt6INq8S00pcpd5ss9uP/32
         nCUUrdgdP8DeowTLsQ3gz5n32lWSoAhV0nc0w2xkmEAaz9btOeETu/gNKo+wUl1GnXZI
         a3B2x5y8UkBWujlQwXERz1tIvlTYgkuUCet9bmm2Neyv8h8c8/CnDvuqa3LA5rPIZVAZ
         6hV/q0gexHPDL3k03arStmVhoG/REyTz9R47LjPLpNQr3+IE8f8bJi+eHbQnnIm61qi7
         Xg8Q==
X-Gm-Message-State: AO0yUKUn58KI99oXey8A3aoWb8YpJ5Jgs9YyHeGiPxabo/MwwwToZDe9
	FlKzI+OJT583hdJ3R1lwxnE/2A==
X-Google-Smtp-Source: AK7set9LE8GPOhtY+B1RcIiH1yuIiy0jL2qeqKDiUlM0tAifpAsNTHw/az3I4uhlO37/K0cCECo23w==
X-Received: by 2002:aa7:9ad6:0:b0:5a8:ab62:28fc with SMTP id x22-20020aa79ad6000000b005a8ab6228fcmr3620669pfp.9.1676275046246;
        Sun, 12 Feb 2023 23:57:26 -0800 (PST)
Received: from openbmc500G.LAB.ufispace (CH210-63-217-225.static.apol.com.tw. [210.63.217.225])
        by smtp.gmail.com with ESMTPSA id e9-20020aa78249000000b00588e0d5124asm7255959pfn.160.2023.02.12.23.57.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Feb 2023 23:57:25 -0800 (PST)
From: Jordan Chang <jordan.chang@ufispace.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	joel@jms.id.au,
	andrew@aj.id.au,
	robh+dt@kernel.org
Subject: [PATCH v5 0/1] Add Ufispace NCPLite platform device tree
Date: Mon, 13 Feb 2023 15:57:18 +0800
Message-Id: <20230213075719.37276-1-jordan.chang@ufispace.com>
X-Mailer: git-send-email 2.39.0
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
Cc: jay.tc.lin@ufispace.com, eason.ys.huang@ufispace.com
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Add Ufispace NCPLite platform device tree, and add the compatible
string in dt-bindings files.

Changes for v5:
- add "Reviewed-by: Andrew Jeffery"

Changes for v4:
- revise the tags

Changes for v3:
- add "Acked-by: Krzysztof Kozlowski"

Changes for v2:
- modify node name to generic one and check with dtbs_check
- send-email without confidential mode

Jordan Chang (1):
  ARM: dts: aspeed: Add device tree for Ufispace NCPLite BMC

 arch/arm/boot/dts/Makefile                    |   1 +
 .../boot/dts/aspeed-bmc-ufispace-ncplite.dts  | 359 ++++++++++++++++++
 2 files changed, 360 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-ufispace-ncplite.dts

-- 
2.39.0

