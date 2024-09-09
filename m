Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D409971127
	for <lists+linux-aspeed@lfdr.de>; Mon,  9 Sep 2024 10:07:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X2KDx4Qk6z2yWK
	for <lists+linux-aspeed@lfdr.de>; Mon,  9 Sep 2024 18:07:13 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::102e"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725869230;
	cv=none; b=Irhn0/1GNSPBqtMUk/9CKS/Y77uPc0nEIsqWu4339YEukaAOEqB9Hk8FRiLKdx8BZZS+B7niD1DDYl2yYLRzLpAyDqzKOEuA9zDkl7AojIUxo5lsSmyixMAQqCFeoZtGiQcw4nmYJ90efdB0ukgDmML7ID2viubZ15v0pEwvg3N3pqq7f1ivWGjjtvk60a2BXUPBS+vgyBaXZqmYBwMs67IPoMSHEgkO9MBr7e3GAy4yxXRZ2t31D4utS1uI0KRhM4gVd2YfdosNJZJqQR1Qz4ozV+5+LlVqmdWYtxCtCnQe/y3588+0dhE9VH0dUVqr3BArCERwMYet55WU5piyNg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725869230; c=relaxed/relaxed;
	bh=XsoTzFsLsOI/w258RMCU0+gqn7DEsQeaEMM3PNeHoEE=;
	h=DKIM-Signature:From:To:Subject:Date:Message-Id:MIME-Version; b=URQ9ZNd9dFinZHqsQuYQztDu8OpOQVrcIypg+H8TGXRHuUCssU5LlXglOG9qb1qrbzfdJgkMg2+kbJ+pCo0cOxuT1QTIcniUyf2+YxkKwC1PX3pOva35Qu1eIEV/8XkSP0/yRBEJDailsnFiwNZvYJXZ4LQLMOjUasx2DDmtVwtn2p7wMMF8+hhdJzH5sYHtWavcW/3yFrG843jCwp/ISjzpAT3ZlBl3wRr2BshWkWh6NvKLzc+T7ktN9aWKLl8eH5eJs1K4d/T3zKKWY2BNRmpRbNSdMYrZrNSyiUivYExfTkWOFGmk1qkZwCsGPCjWm+tUj+q+WuMAJRa8KeuxXw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=SSTojrBm; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::102e; helo=mail-pj1-x102e.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=SSTojrBm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102e; helo=mail-pj1-x102e.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X2KDs2SWDz2xrM
	for <linux-aspeed@lists.ozlabs.org>; Mon,  9 Sep 2024 18:07:07 +1000 (AEST)
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-2d87a0bfaa7so2871529a91.2
        for <linux-aspeed@lists.ozlabs.org>; Mon, 09 Sep 2024 01:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725869223; x=1726474023; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=XsoTzFsLsOI/w258RMCU0+gqn7DEsQeaEMM3PNeHoEE=;
        b=SSTojrBmufH3/yVw2FQ3f7DACif3miAYwpi/uYCnjzjsC/KCP8thRyMDpsVUKdCezj
         KaYPmBSKzPJcEOouiGGLqWJOPvbD8LbPSTg0O5ZVgTVhqUdCQUTszPUQyOYdq5L60QFC
         54Hnop0LsB4bC8idAjUPZdbkbq1JZW3tN+6MRwmi+slpqHIu/FfaJfNC2EWthJIzcnEM
         26gkcVjbem2HzDggy6uZAHhVOLwVnc0aPSEQERcLXiZN60OuwqYxx3CTTzRRHR1wUESd
         wp0uFChm6sjv4+48cMvoOSIq+MJFyc55yIQ/1YFpik+EBLyzoQnue2MoNMpsgbsk5Atx
         4Nsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725869223; x=1726474023;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XsoTzFsLsOI/w258RMCU0+gqn7DEsQeaEMM3PNeHoEE=;
        b=UReMfxXfjmdcmHw19sN5N4QXjPxQmZlsiDIkXfDK4VAOopA63j2Y5VM2qmUFpOjSag
         w16/C9HabnS52a9jbfxHFi6rR8dDMQN1xCvEF4F7VBrf+lGnGqzAszkhBhyuYK0vnVTT
         6WVAKyLHhG5iDnKiZv7u8sUKeZx9876or+rwpLwDnwAdGecOI44Vn6XjJDFtIcVKbqgJ
         AjoXIJxTZt1R79FsLk3BeOmjieYrGSAzZ5Ntic3bMIh8j1ikrsDjTNpDYQoWmj1CKbJs
         rVI07a6Yj9CgTWiLh7O1vKfvPTfwOBxkAJaYMccptNN8qnqd6l70Jy+2uY7yv3IOUwaq
         rF3A==
X-Forwarded-Encrypted: i=1; AJvYcCUnmiHG/uuVnv93CzQJGlQI7rYYYOC84KHp6FaMkgQPR5jDUAblgjAJN5hmaWr0m7iOtON4FTrVCXBMIks=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yw7Uf3RE6yac0OYSM/YJ9reGknskWBXAjJGpIINqgxYh2PMUU6j
	LemVKrwTdj5pYh7v3uvbqWa/kREE9xj+T+U90Tds5EmesIPr0alq
X-Google-Smtp-Source: AGHT+IF6oXCvfc8VgYNsXQO/2GtRP6QDKcH1+YjF5irjxf2iHlKXOG8pmI561LrKrPwJlXTrMMJ05A==
X-Received: by 2002:a17:90b:3c83:b0:2c9:6a2d:b116 with SMTP id 98e67ed59e1d1-2dad4dde0bemr10713383a91.7.1725869223170;
        Mon, 09 Sep 2024 01:07:03 -0700 (PDT)
Received: from peter-bmc.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2db043c4916sm3917541a91.31.2024.09.09.01.07.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 01:07:02 -0700 (PDT)
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
Subject: [PATCH v3 0/2] Revise Meta(Facebook) Harma BMC(AST2600)
Date: Mon,  9 Sep 2024 16:04:57 +0800
Message-Id: <20240909080459.3457853-1-peteryin.openbmc@gmail.com>
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

v2->v3
  - Revise sgpio line name.

v1->v2
  - Fixed the mail and author.
  - Revise presence-cmm to sgpio.

v1
  - Patch 0001 - add rtc device
  - Patch 0002 - update sgpio line name


Peter Yin (2):
  ARM: dts: aspeed: Harma: add rtc device
  ARM: dts: aspeed: Harma: revise sgpio line name

 .../dts/aspeed/aspeed-bmc-facebook-harma.dts  | 45 +++++++++----------
 1 file changed, 21 insertions(+), 24 deletions(-)

-- 
2.25.1

