Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FBD3965CA9
	for <lists+linux-aspeed@lfdr.de>; Fri, 30 Aug 2024 11:24:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WwCQ92whxz30T1
	for <lists+linux-aspeed@lfdr.de>; Fri, 30 Aug 2024 19:24:01 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::131"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725009838;
	cv=none; b=MQ2eirnbX1jmJTeIPPm9268h/R7uQ2b/B7tdnmFe9WUwLUIGBw/szvWAaQMYgXdqHFrqYd8j4QWMVX3Zur7wnEgtuZS+MZfiQeJgBQsEv+dzMmZ6FYFJWgaKjvMH5OuRLclCWMOkr/AJCJEBtPbVvFyASEcbe9M7+sEdfaOxsrhMmT84Yfn0aQBi5pMgAsBm/sL/EpNMeYmNH3FWabvZW7YjqnqLcfqhZvZeWWmetcVgeJWhdHSNYERmn7a2mcSWYzojUrvDivTcuyGOmDSCjPvP/ViScJh8fc7ASq4edeZYbavC4RPGf85gcK10nZB5NmUvxUpiKkutRMAptUk9sw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725009838; c=relaxed/relaxed;
	bh=xZDAutDjqhZj7c0NNMu29YVXiCz0AlDollbWjsVJAnI=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Google-Smtp-Source:
	 X-Received:Received:From:To:Subject:Date:Message-Id:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding; b=POPOfcylf50RDwrj/y+gyOqK8zNGLhjTS+xiWQTeWy1QOZFb3ij05HLdXCp/B8PimEJSa4OTSn6TZqX307hACqhY0jeZagu1m1Qd0qT+7Bg6o14GCqYwnGkFIqUi8/nh9xVeXoPp+i0ALo+V/XoyXrlAVriLB9Q1L50sXxqowErGHJTHTBpR86RFKI/AfRAG5tFwyQ8KfMG1WaBKzwaaK8auQgP00jsjmuGyEr7XvTYlMmy7a1i8UnSj6d2r6D893m0k4pCT6Yyp2Bb4xIPHRBM6qN9I/7A6dnQdIavnpX6gffDyoIgJ0ep5NtSier+mhJ2UQZoeJbvtWPRr5ypEBg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=VBjE9tcT; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::131; helo=mail-il1-x131.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=VBjE9tcT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::131; helo=mail-il1-x131.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com [IPv6:2607:f8b0:4864:20::131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WwCQ52Jgrz305P
	for <linux-aspeed@lists.ozlabs.org>; Fri, 30 Aug 2024 19:23:57 +1000 (AEST)
Received: by mail-il1-x131.google.com with SMTP id e9e14a558f8ab-39d34be8b64so5422035ab.1
        for <linux-aspeed@lists.ozlabs.org>; Fri, 30 Aug 2024 02:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725009832; x=1725614632; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=xZDAutDjqhZj7c0NNMu29YVXiCz0AlDollbWjsVJAnI=;
        b=VBjE9tcT6Rn5iMq2tvKIIKM0MDxH/uP02NOOR5PoJNKoS9VEzGh6k7OC5NXotFUkhE
         jcJYZThUJQN0lezt85jeSc7coFD5mmSDmbIHtd8LrMO9sOa6GAI2vzQVnf6lPmh1pFgq
         A6f4qTsLCI3rfYIusHGWLGAYquVMajfNDXsfNuvxiW0ZvxicliVYCyeWNjRtMmW4zhWG
         SRT/AODMFvgOFpJ+5tmRBpRl4SgBVfU5rMH/o5l//1qPeSEB2c2i0MRI9lOQKQkb5Su1
         4sB79D+60Y3Ef8TODWTUiHOQvH2xG/FWbQM2rwDMEDNUdpKTU8ADObUV4MMQIANptfsn
         f/yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725009832; x=1725614632;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xZDAutDjqhZj7c0NNMu29YVXiCz0AlDollbWjsVJAnI=;
        b=sn2edx1h7gksQXiCVF+i4rI9px0QErm0+aK8oPfeft9kV86F0foEmerJCR3kUgZ/U0
         usj5MzDRFgT6JP8cMmadDdQFhzjNa9gHLPb9xgKi0kapk8oR6V+/IUd6TOQwKy37XXRl
         hgOlaT0m27F5/aK142IgCMP/YR+xXUWG2z+0R9jokExut71jOAz/ybqhow1L1m7Eib8g
         j8FMVGBjGwM4OEw5M9uVL3nIztydXGXXUOkTPxMv0ksAkkY8NGReYS5hKpjLW64KwOFk
         Q8EQnQMr9+WFtyG3Rfm75ltHQa9PMZT7T39zIuaNRYu7VAXwhsQncqoOD2vprVJagUvE
         OMCg==
X-Forwarded-Encrypted: i=1; AJvYcCXqMS7MrpHislVBGzjUe1HGyrXzSNE9LwquhXmHVTmzdie03bOm1hlBymcu9w+C2gG5y7r7ciypAg0V938=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzjOfb3fHYvbJ/0HENb9ODvGKJJbn36nbfnjELi7mM0nfBUqtk+
	0gU/Tx8rDhyAvNzyaFSNiKrijV47MCyHTAMPcYtmF9vNs5AhVzBM
X-Google-Smtp-Source: AGHT+IEvRI+J7ec9MMAI8J4MgnZzteIzgy1idxmJxN6SpADJY9EojNwl6YKOP/9WF3/rXLkY3wx23g==
X-Received: by 2002:a05:6e02:1988:b0:39d:2e35:4d88 with SMTP id e9e14a558f8ab-39f379e6c36mr56657545ab.28.1725009832349;
        Fri, 30 Aug 2024 02:23:52 -0700 (PDT)
Received: from peter-bmc.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7d22e66d8f4sm2566744a12.0.2024.08.30.02.23.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Aug 2024 02:23:52 -0700 (PDT)
From: Peter Yin <peteryin.openbmc@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] Revise Meta(Facebook) Harma BMC(AST2600)
Date: Fri, 30 Aug 2024 17:21:45 +0800
Message-Id: <20240830092148.1574520-1-peteryin.openbmc@gmail.com>
X-Mailer: git-send-email 2.25.1
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
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Summary:
Revise linux device tree entry related to Meta(Facebook) Harma
specific devices connected to BMC(AST2600) SoC.

Base on: https://lore.kernel.org/all/799dbd97b09693fba6f837e73d4ef3421d604a8a.camel@codeconstruct.com.au/

v1->v2
  - Fixed the mail and author.
  - Revise presence-cmm to sgpio.

v1
  - Patch 0001 - add rtc device
  - Patch 0002 - update sgpio line name


Peter Yin (2):
  ARM: dts: aspeed: Harma: add rtc device
  ARM: dts: aspeed: Harma: update sgpio line name

 .../dts/aspeed/aspeed-bmc-facebook-harma.dts  | 41 +++++++++----------
 1 file changed, 19 insertions(+), 22 deletions(-)

-- 
2.25.1

