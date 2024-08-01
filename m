Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C623944FE4
	for <lists+linux-aspeed@lfdr.de>; Thu,  1 Aug 2024 18:03:50 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Xvsaz8D0;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WZYfq6rlQz3dTM
	for <lists+linux-aspeed@lfdr.de>; Fri,  2 Aug 2024 02:03:47 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Xvsaz8D0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1032; helo=mail-pj1-x1032.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WZYfk3hj1z2y71
	for <linux-aspeed@lists.ozlabs.org>; Fri,  2 Aug 2024 02:03:41 +1000 (AEST)
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-2cb81c0ecb4so1716901a91.0
        for <linux-aspeed@lists.ozlabs.org>; Thu, 01 Aug 2024 09:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722528220; x=1723133020; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=0iSQx0LSYPKW7iNUhjHvQF3N3bFEk4OBEBVOYBRn8CE=;
        b=Xvsaz8D01je4mP8Fx9vQlGze7YRchiQv5jt8kBV/e1Kikr0fM1vlR37P22ykE6P/M3
         CsIPa2ShAx/onYgMHSacAw0cG8eIGCAXDc08+bL6QXhjIE1EHhCie+Mm2Hr/u44SFgqM
         RmVEco7PynE9C0obhOSvvYGmeuHetkNfpTYJXUjDTnYaP/0XBHkzXqPtViMJ4hDXCx62
         nMjpTHKB2i7Hdf/2DplteYd7R2octXmx7rIDd4rplnJ/TxOatxXZD1DO0AmoD9F24puw
         KLQhJ4y17/hDvTBWZ71z2F1bpifc0CQzDQ0N/JTyyiG4e/dRzQhEGuEotW6b8oxiZygZ
         dbcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722528220; x=1723133020;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0iSQx0LSYPKW7iNUhjHvQF3N3bFEk4OBEBVOYBRn8CE=;
        b=t6V72Nlvs7hkf0A4om1NKAHAB2gF3FEoTiEHxCeKmi7x8wgNs3dWyNwWmi6boI1EM6
         B2SCvC6gFh8ObxoSkXdA2uAvKTaQ5lLEcIIyu+4mWWyxFE8U3ZdNjnyORzKZH/NqMQnB
         sWDVclMNfhbgaImOyOUwPxm9P5leYR0E+5CD8jOsNT6UgX0wj/Ldg/3q7XMNAGinuyUw
         BR7KzhL5+UfsCiIYioRnFvmcRUaOQXrOak4h7OvwWzpNy7D+kRu229oDAEeF3S+zzFj2
         EkdiXRAmQn1NqdljB+PPFk+5+/UxZIlkFNEJjczot2NJ8Qay/T0NSBP7JDnT/ExChLRJ
         0+fw==
X-Forwarded-Encrypted: i=1; AJvYcCVjYN4OsXlQpc8KyvaEh7mbpmWkEGWavZrk9cAfmlwaKxW1et/OG9gdSDk4RRUC0XOMdNW9vLwzn4U/3Dr+D8VSCc0Q3ZxMte38sONm8g==
X-Gm-Message-State: AOJu0Ywxe77pJ6gknv2eddbullGkzQ2n3byhIsY/Curp8KovhMt2hXLf
	H1iqe1wmDjSizpjsCzBFGHDlRQ+x70yrf8qZ1WYSTUwUDIu0zlb7
X-Google-Smtp-Source: AGHT+IG2Zy3wE3OxHJ4u0hL4iPjkRZIx0Jv+V/YUEvEBrtQkeXj/vL6XWFNEWkD/3SCKi/rDwudx9A==
X-Received: by 2002:a17:90a:62c1:b0:2c2:4109:9466 with SMTP id 98e67ed59e1d1-2cff0934873mr2727019a91.8.1722528219906;
        Thu, 01 Aug 2024 09:03:39 -0700 (PDT)
Received: from peter-bmc.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cfdc4cf181sm3535268a91.37.2024.08.01.09.03.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Aug 2024 09:03:39 -0700 (PDT)
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
Subject: [PATCH v3 00/11] Revise Meta(Facebook) Harma BMC(AST2600)
Date: Fri,  2 Aug 2024 00:01:24 +0800
Message-Id: <20240801160136.1281291-1-peteryin.openbmc@gmail.com>
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

Base on: https://lore.kernel.org/all/CAPSyxFRj0twCJG6Lr5UZpznrUHyd_L0Reo=kZSFwCw3FNQ+x+A@mail.gmail.com/

Change log:
v2 -> v3
  - fixed dtb_check warning base on https://lore.kernel.org/all/20240801153429.1277378-1-peteryin.openbmc@gmail.com/
  - Patch 0011 - remove pca9546 from i2c9

v1 -> v2
  - Patch 0007  - add fru device
  - Patch 0008  - add temperature device
  - Patch 0009  - enable mctp controller
  - Patch 0010 - fixed dtb_check warning

v1
  - Patch 0001 - revise hsc chip
  - Patch 0002 - add VR device
  - Patch 0003 - add sgpio name
  - Patch 0004 - add ina238
  - Patch 0005 - add power monitor xdp710
  - Patch 0006 - remove multi-host property
  - Patch 0007 - remove pca9546

Peter Yin (11):
  ARM: dts: aspeed: Harma: revise hsc chip
  ARM: dts: aspeed: Harma: add VR device
  ARM: dts: aspeed: Harma: add sgpio name
  ARM: dts: aspeed: Harma: add ina238
  ARM: dts: aspeed: Harma: add power monitor xdp710
  ARM: dts: aspeed: Harma: remove multi-host property
  ARM: dts: aspeed: Harma: add fru device
  ARM: dts: aspeed: Harma: add temperature device
  ARM: dts: aspeed: Harma: enable mctp controller
  ARM: dts: aspeed: Harma: fixed dtb_check warning
  ARM: dts: aspeed: Harma: remove pca9546

 .../dts/aspeed/aspeed-bmc-facebook-harma.dts  | 177 +++++++++++++-----
 1 file changed, 132 insertions(+), 45 deletions(-)

-- 
2.25.1

