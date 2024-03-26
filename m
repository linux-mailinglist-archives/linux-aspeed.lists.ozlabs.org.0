Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 57BA19578F9
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Aug 2024 01:56:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WnqHl5L2Xz3dWY
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Aug 2024 09:56:19 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Eq0pRvv4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2001:4860:4864:20::33; helo=mail-oa1-x33.google.com; envelope-from=ppighouse@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oa1-x33.google.com (mail-oa1-x33.google.com [IPv6:2001:4860:4864:20::33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V3mRk441cz3vlX;
	Tue, 26 Mar 2024 21:36:01 +1100 (AEDT)
Received: by mail-oa1-x33.google.com with SMTP id 586e51a60fabf-2228c4c5ac3so3265794fac.0;
        Tue, 26 Mar 2024 03:36:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711449359; x=1712054159; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KUoPhAxP6OeKuxAApMMPObFZdH2Lwn2Oh9PCqeapu+Q=;
        b=Eq0pRvv47VmDrKsKU+jFzTxycJj+K3aFLqQZGRZkjzXMr4+rIt1mLotHaBkLYGs6Wm
         P2n/zoMphdazqZcD7DnWXqTgkTKWAZrk9ybI0b3cSQU6S+G6buKR+/4F5RF9FvIJTCoA
         dI2wZekIesHxPz63Ev4uTn/1melzW+cqKjbWqrES9wvm3sgCzvR02nf6efnNmKd3Kx2g
         dZiqZQeTbobY9EXAP6gCYAe5jvVMt5tSV0CWwK399oQ4pWJjUSXV0ArRs0R4jbmc2Sfr
         bcNKd7aJ2YREgYrQzaokivcdmY/FLJmJ1ffgTPtepqPs9+L3pctU4BlTBHz4PwD0GdIG
         ALow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711449359; x=1712054159;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KUoPhAxP6OeKuxAApMMPObFZdH2Lwn2Oh9PCqeapu+Q=;
        b=tay/ejakOeuWmQTWapoMVUVKevGKB3SN7KtINrS9hOS68D+JZApC67xR8FOv+p7qwx
         6zh0X/bgRVxCsF8w59FgqTC07Msg0r6xtltBuEaupCKb3S3Zc+dICO+shjhVGhCkPWr8
         RtTItOF/lm8HiSDNbQFpX4o8oTvRV6g+Nj30gW5shjpegSKTaA3c7hFUwpF7Q91ak3sz
         VJN4P//kai7s6MSLRJnCJBjwd36M4I3V65NtbkPWbdyBUxvRNDKfPZhcf07gCzt8V2Gx
         U15o796nKHNQipc3jgvFwMJPY8iq08EDjpYjcu0B6vJUWKgD9/RYvA1xta4gaRu2muXK
         xajQ==
X-Forwarded-Encrypted: i=1; AJvYcCWcFvBR0ier24GmiD6lBSZg9Pl9DNf2gACFBIp3Pi6zR1PjQgfVf2ojl1358R4HA40UazXncrXxaCQZUGpm253WsA+d+2FT8l/UBxsU7l6tNWgYnDIBdmQUXO2X2pgPm3hPuEDNmbSX
X-Gm-Message-State: AOJu0YxYsh5Qjz1LYqu8aJY8QCko7NHZX/1HOi7oreGav5iKA4oupQ4C
	hAYWGF/nmHMXslK0GOlq95+MraD6QC4QVHcFHMYLScCbQc3Pw6cf
X-Google-Smtp-Source: AGHT+IF+/TyU7QvcPL8z/7aJOBNyEi3udPsi6Rr+EqdIy/sG3yo5Md4hoQBCnmPbzBoKuu7bDmTNUQ==
X-Received: by 2002:a05:6870:2252:b0:222:4bde:fede with SMTP id j18-20020a056870225200b002224bdefedemr976511oaf.13.1711449359138;
        Tue, 26 Mar 2024 03:35:59 -0700 (PDT)
Received: from localhost.localdomain (125-229-150-10.hinet-ip.hinet.net. [125.229.150.10])
        by smtp.gmail.com with ESMTPSA id g14-20020a62f94e000000b006ea90941b22sm5554215pfm.40.2024.03.26.03.35.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Mar 2024 03:35:58 -0700 (PDT)
From: Kelly Hung <ppighouse@gmail.com>
X-Google-Original-From: Kelly Hung <Kelly_Hung@asus.com>
To: robh+dt@kernel.org
Subject: [PATCH v6 0/2] Add Reviewed-by and Acked-by tags
Date: Tue, 26 Mar 2024 18:35:47 +0800
Message-Id: <20240326103549.2413515-1-Kelly_Hung@asus.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 20 Aug 2024 09:56:01 +1000
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Kelly Hung <Kelly_Hung@asus.com>, krzysztof.kozlowski+dt@linaro.org, Allenyy_Hsu@asus.com, andrew@codeconstruct.com.au, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

There are no changes to the Patch file, just the reviewed and acked tags are added.
PATCH v5 has been merged into the next branch.

Kelly Hung (2):
  dt-bindings: arm: aspeed: add ASUS X4TF board
  ARM: dts: aspeed: x4tf: Add dts for asus x4tf project

 .../bindings/arm/aspeed/aspeed.yaml           |   1 +
 arch/arm/boot/dts/aspeed/Makefile             |   1 +
 .../boot/dts/aspeed/aspeed-bmc-asus-x4tf.dts  | 581 ++++++++++++++++++
 3 files changed, 583 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-asus-x4tf.dts

-- 
2.25.1

