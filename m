Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 86C6F7A412E
	for <lists+linux-aspeed@lfdr.de>; Mon, 18 Sep 2023 08:30:33 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=g/VOSK4T;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rpw036Klbz3c67
	for <lists+linux-aspeed@lfdr.de>; Mon, 18 Sep 2023 16:30:27 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=g/VOSK4T;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::631; helo=mail-pl1-x631.google.com; envelope-from=yangchen.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RlQQP3pP8z3cFt
	for <linux-aspeed@lists.ozlabs.org>; Wed, 13 Sep 2023 00:07:39 +1000 (AEST)
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1c364fb8a4cso51439975ad.1
        for <linux-aspeed@lists.ozlabs.org>; Tue, 12 Sep 2023 07:07:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694527656; x=1695132456; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TUhyRSqjAJMHfchXSv8vB6A2VUPoLZLC4S3Qj9415dE=;
        b=g/VOSK4TEBxBsMG7VV/lsGXw5Wthm8inIWDqNXwvR3jJ15khvEJmRYsT5dguVX6C9M
         DlsgWocFrj8WGkCT7WGTpcBxQFGRpO7eLqlUjjQ6K0BybgZov1x86ywE8niUpFSscrYm
         KdZDRCiJSyRWkAeqPyymP2NHmf5YTbfCXV65+ywjEzcwnGcU1YtTLxA2YOVckZSQoq4d
         SiFj1P+NC7Oock+XJF467UH94yxwwcTzDBRjqvoKXakV15HVCw3k+17z+EYv8nnVemfD
         0yXfjhsiFkyH/WuKv7ArbnN1Of4C7x5CT/HEeqIUweRyx+u2/eRGycVbNdYbGFZUVlbZ
         3HvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694527656; x=1695132456;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TUhyRSqjAJMHfchXSv8vB6A2VUPoLZLC4S3Qj9415dE=;
        b=q5BHMHNwwBngNhQyFzwpm7WTUB9Ndf3LrvbYGHrHRv0yfh5DtvKY7jE693fq44+8NY
         M3DygYc3iSDqW0c4FCOg+97oh61Qzy946Umdb7oliKLZlq5N/yzq5L0bYsNaez3Pkqz1
         W2F6z/QRg4RiC24+X5we666vYiaIxkSyfKu1/Hy22vFOzzsCQu/YYKQ830/xBcpgMgaF
         k+d2Y9GfA+HKZS3e6eE5kMiB9PtOyCn1oGS4Qj1QcNkbNNeR1oaUCdAUe5kS93NfFlE4
         sNon+N/xgVO3qf+cpvpVEq/w2fTRXRGLe0CsbRWVfIEehi4ztRmT7Q/0gwZmxjQep/j4
         dBjw==
X-Gm-Message-State: AOJu0YxBUbkU9qdM8TYsLgV12u+rOBJBDUlQJSLVsj/LQEkiuYdQXyEw
	oHVpUvr/dUU7QQKv2llKgcM=
X-Google-Smtp-Source: AGHT+IHXvjk+tZSSBEb6ffotvkMtR8CMbCOjafTNW6qXt3LTUbTa1WVbgUKpMeGmB758hjn/I+dyow==
X-Received: by 2002:a17:902:e5cc:b0:1c1:f6d1:3118 with SMTP id u12-20020a170902e5cc00b001c1f6d13118mr19644997plf.27.1694527656627;
        Tue, 12 Sep 2023 07:07:36 -0700 (PDT)
Received: from obliging-System-Product-Name.dhcpserver.bu9bmc.local (1-34-21-66.hinet-ip.hinet.net. [1.34.21.66])
        by smtp.gmail.com with ESMTPSA id jb11-20020a170903258b00b001ae0a4b1d3fsm6357762plb.153.2023.09.12.07.07.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Sep 2023 07:07:36 -0700 (PDT)
From: yangchen.openbmc@gmail.com
To: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	joel@jms.id.au,
	andrew@aj.id.au,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] Add CMC of Facebook Minerva platform
Date: Tue, 12 Sep 2023 22:05:30 +0800
Message-Id: <20230912140532.3797736-1-yangchen.openbmc@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 18 Sep 2023 16:30:23 +1000
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
Cc: patrick@stwcx.xyz, Jerry.Lin@quantatw.com, EasonChen1@quantatw.com, Eddie.Chen@quantatw.com, yangchen.openbmc@gmail.com
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

From: Yang Chen <yangchen.openbmc@gmail.com>

Add linux device tree entry related to Minerva Chassis Management Controller
(CMC) specific devices connected to the Aspeed SoC (AST2600).

Yang Chen (2):
  dt-bindings: arm: aspeed: document board compatibles
  ARM: dts: aspeed: Minerva: Add Facebook Minerva CMC board

 .../bindings/arm/aspeed/aspeed.yaml           |   1 +
 arch/arm/boot/dts/aspeed/Makefile             |   1 +
 .../aspeed-bmc-facebook-minerva-cmc.dts       | 265 ++++++++++++++++++
 3 files changed, 267 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva-cmc.dts

-- 
2.34.1

