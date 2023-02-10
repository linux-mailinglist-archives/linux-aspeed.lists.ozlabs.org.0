Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 52CB9691CFF
	for <lists+linux-aspeed@lfdr.de>; Fri, 10 Feb 2023 11:39:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PCqwM1tkxz3f4F
	for <lists+linux-aspeed@lfdr.de>; Fri, 10 Feb 2023 21:38:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ufispace-com.20210112.gappssmtp.com header.i=@ufispace-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=x98gOVnw;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ufispace.com (client-ip=2607:f8b0:4864:20::531; helo=mail-pg1-x531.google.com; envelope-from=jordan.chang@ufispace.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ufispace-com.20210112.gappssmtp.com header.i=@ufispace-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=x98gOVnw;
	dkim-atps=neutral
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PCqwC2KHyz2xHb
	for <linux-aspeed@lists.ozlabs.org>; Fri, 10 Feb 2023 21:38:49 +1100 (AEDT)
Received: by mail-pg1-x531.google.com with SMTP id s8so3403712pgg.11
        for <linux-aspeed@lists.ozlabs.org>; Fri, 10 Feb 2023 02:38:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ufispace-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nq1A52HyPQ5ZJyvE3xyTJAITHc2QB2emFWUPFKG5KFI=;
        b=x98gOVnwRN1wtMLo1EqRtcRx6sR52zIeCiZR9RiVjTGlwUjK1suW/T//IdwqyaPuyG
         N0TvrmBv6ohghhZtULX1QdppYVCL8+nxq8EU1r4tIHz4kdSTaidlUTl2X8ZW5rQY8Jbw
         Uenng2M3rWKGxnNH6yfDiqOtu+MxRPOgrvaQ6+xQg9gRdZu/dd2TeJhiIViDYg3kJn/e
         sTWCxPsd2VbXIdHArvsvvqhAfoS4M0+SbWuJ7ldJw3qZv8FBPyj7mk9IZ0B2X+Jgndon
         Yo3quP6cZJ05Rvjylb657HdNFZa6Cr3x/PFtKO7j2oEWuRnPpIpqJ8oGN6oxCSBu+S1K
         lrkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nq1A52HyPQ5ZJyvE3xyTJAITHc2QB2emFWUPFKG5KFI=;
        b=pXv5/Msf1AUUvoZn7uZiSyN/K7LFY5Be4fprbXyrWfNxMnZO3dFUxzOLObZjDhZAi+
         5Xl2dVDAYR9X1z6v6T0jCtFTLX0Y+m2nmGvucp/38Z8LrjPRa/vXT1vVAYr8og3fHRPO
         j0kgnv6l68cj/Z8vJhLLtoFNyHdO+6OJIuYufWuoTsisqvkGVXlu630FBHs3k5Ltso/1
         nQgaMzp+0Xyh0BfvydcCqU+l/Q42E0flPZbEMc3L+wjBGcwvRk9SBrAKH8hkUYMa55ri
         nLVrgRdyM25z529dpSGgdZ10HT8dl0m6FxXnvnrwlDjOo5426OlnkqsMBT/yWR4HKFDD
         Mt3g==
X-Gm-Message-State: AO0yUKXMIUKDVZNgooegbowx4nIMXxsHx+OOm2thadawybtIxNh8l06L
	f7EMqqXv5K5KwKuD0Gxk2Y9yuA==
X-Google-Smtp-Source: AK7set8zKiuI5dv/fykGPWJu0ufw/4kTODffMuzEHuFxyU4aQQNrPNULPBEq2EJ8Ts0U7t9+sW1Biw==
X-Received: by 2002:aa7:8685:0:b0:5a8:4de9:b797 with SMTP id d5-20020aa78685000000b005a84de9b797mr5337934pfo.14.1676025527036;
        Fri, 10 Feb 2023 02:38:47 -0800 (PST)
Received: from openbmc500G.LAB.ufispace (CH210-63-217-225.static.apol.com.tw. [210.63.217.225])
        by smtp.gmail.com with ESMTPSA id v25-20020a62a519000000b005809d382016sm2973950pfm.74.2023.02.10.02.38.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Feb 2023 02:38:46 -0800 (PST)
From: Jordan Chang <jordan.chang@ufispace.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	joel@jms.id.au,
	andrew@aj.id.au,
	robh+dt@kernel.org
Subject: [PATCH v4 0/1] Add Ufispace NCPLite platform device tree
Date: Fri, 10 Feb 2023 18:38:28 +0800
Message-Id: <20230210103829.74470-1-jordan.chang@ufispace.com>
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

