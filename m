Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 372A395C5B4
	for <lists+linux-aspeed@lfdr.de>; Fri, 23 Aug 2024 08:43:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WqrBJ0GV4z2ysZ
	for <lists+linux-aspeed@lfdr.de>; Fri, 23 Aug 2024 16:43:36 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::634"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724395414;
	cv=none; b=QbH4jdritogV9s2QXj+5fKbjR5UBqqLhpue8rsbeuBz0gaTNWDP4Hs4I0ENlZ5vJxgurf0g7IZJ/OE7/gpcWuFBojUBTJeQmRNbXmkveSPx4arjIvXjWOD6BABxSI7k2QSqZZIe8SuzXDh+zavwCpA3ZrzjGxCkSLnUPo85UIquk2vdSuj8onAgBhBHQCpC3G1SsKOf12E8Ztsfci5STzHgdhF84pSsc+p/DBVMyRPkYokHXF3KnvkZTGxsisPJ78paRm3i5PJaDFnbteDZPcZ0R2UaJFFSNxhoNFzcLOTJilNuCS6fTUU4iJhvI0eAnrL+NO1WgXUmCliUp7eH5AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724395414; c=relaxed/relaxed;
	bh=0LIGiCqAT5XD49+SAqkLUK5mOjqO4w1JHNemNZLGIEM=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Google-Smtp-Source:
	 X-Received:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key; b=igst76xzieK5hWvigkgUFayg/XrI3GuP1el0+BV+fQ38oYvFtAN3Xua0EOnNX58Cb27wGpuw9dfPdVy8kGz2utGQ8g2zsy8SNOdSyvg3aeEcJ7XIzJ6PfWXV3d48jg44Z3nZKC5wL/SGM5mY/dKpToc82Cltq440XfpSKwEO8ssoquJ4RXLgQpRrqCemyg2ROBSCagD+/WGh6WwhRlVFDjTfBkk5WPzrvayFaTw6DvaHAk2VmdhyL8of+YUi7RgTZbgC+BFdgQ56W4fIKrBWqHGgDQ2bzpu5byHdmnyxiAQG5ReNLOMXi68fpPngjwfgN9hLPsyfZbo82h9ULozslA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=mqgKnLNI; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::634; helo=mail-pl1-x634.google.com; envelope-from=potin.lai.pt@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=mqgKnLNI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::634; helo=mail-pl1-x634.google.com; envelope-from=potin.lai.pt@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WqrBF4DhJz2yGD
	for <linux-aspeed@lists.ozlabs.org>; Fri, 23 Aug 2024 16:43:32 +1000 (AEST)
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-201fae21398so12698985ad.1
        for <linux-aspeed@lists.ozlabs.org>; Thu, 22 Aug 2024 23:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724395409; x=1725000209; darn=lists.ozlabs.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0LIGiCqAT5XD49+SAqkLUK5mOjqO4w1JHNemNZLGIEM=;
        b=mqgKnLNIkQvthh0TvLoWzg06ws7KsAXNpwtQ7MTGhWQAI0IY2NQ4xrICWnsMOCgG2w
         YcyvhdxNUmO6ehdZql8uCx0j2yhFVio9r8AwlYkZn1VxuPwPVb1KegHQldUw0gnlyYGJ
         5u4EG0DNnzyo9+J9/CiOezfoPDks+kSJxCO5prkGrPGxlZtV4x2p4pMV/LPyU1uhnT/x
         UZo7MUHyLDJwF4xwIgrJp7IrIA64lhFj40WL/bYUao+pAlgFSzRlMnWHUzzb62sWNH4c
         dO2KHvRv7NPx3cE1nTmhGPDrAHCk1Qk562abzs2MQR4iZxtK1p0HNeIMihq0Ec82B+eC
         XMVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724395409; x=1725000209;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0LIGiCqAT5XD49+SAqkLUK5mOjqO4w1JHNemNZLGIEM=;
        b=Osjm6xSwqZNqlqFJkYlzPbrvjUHSgyZGVkTg7+gCNmXWWUWxSNyZq+e/LUSKZhG03u
         Ba8Y7nNxMRlS8TxHd+xP0arAT1LPHjyhw3rsOaUzxHoar9hpyH+UL7+reg2mPk0sr2hS
         r9s/sDOfYi3IiOph5+McRN2mb5JrP/C46lLSTysoFEoXKZHtPJxUArUu7++YAbSeDshP
         HgoyauExTx8iGZQ70akxdgUV85+KgKYVAMNLb9YmYyjoT0oy/RM0vwnIUI/E4vpKFGN6
         72eU3QcW5xyp+vdtsEQPL4hqZxgyDw98QKLsdDyRiDbh3ogtxMDw5PWQ9ox7io6hvJ4s
         GlGQ==
X-Forwarded-Encrypted: i=1; AJvYcCUOl+NlbXR2PwAOsvE1NKHWmIgnrC/GWWy5RB9dVpCSZUr2lOSWh63zYaVQFaBY/cRLEfla/oBUj0bo84E=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzZS4LdbU29n3oRw7FV6uRGWN5t6iDA0geljhHhRFK5C4egbVeM
	v6XIx+eqdni4S0VEn/6AxxeZsioBoXSuqo3LyCCwL71Xj5nnmX78
X-Google-Smtp-Source: AGHT+IFtonOLbg2TSwnqYkGI74mkskP4aGUv7SwsG/OQ5GZrOBat4xRdE/gdHqCe0HJmkGAqBe7ESQ==
X-Received: by 2002:a17:902:e54e:b0:201:eb57:dfaa with SMTP id d9443c01a7336-2039e4d86d7mr14245815ad.17.1724395409209;
        Thu, 22 Aug 2024 23:43:29 -0700 (PDT)
Received: from localhost.localdomain (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20385565468sm22339945ad.11.2024.08.22.23.43.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2024 23:43:28 -0700 (PDT)
From: Potin Lai <potin.lai.pt@gmail.com>
Subject: [PATCH 0/2] ARM: dts: aspeed: catalina: update IOEXP nodes
Date: Fri, 23 Aug 2024 14:41:09 +0800
Message-Id: <20240823-catalina-ioexp-update-v1-0-4bfd8dad819c@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAUvyGYC/x3MQQqAIBBA0avErBsojaiuEi2GHGsgTLRCkO6et
 HyL/zNEDsIRpipD4EeinK6grStYd3Ibo5hiUI3qmkFpXOmiQxyhnJw83t7Qxah7tqbvDNlhhNL
 6wFbS/52X9/0AEGK2F2cAAAA=
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Patrick Williams <patrick@stwcx.xyz>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724395406; l=571;
 i=potin.lai.pt@gmail.com; s=20240724; h=from:subject:message-id;
 bh=1sJ5+FOd+4XmIQMm4djzaZijr+Y+QcP7+2Ob1OpEWG8=;
 b=M0rdWdkV3BFq7RD1ttVS27ZrTQGjfIoWy0GFg8FNGLL3loWhwKQv2B2eOD4sN5BftAfs+hYXt
 6XfWebX6T8CCufD+lECxPOyl7wxmK6rtcPxcFFv3f82c+waEaJe3MkC
X-Developer-Key: i=potin.lai.pt@gmail.com; a=ed25519;
 pk=6Z4H4V4fJwLteH/WzIXSsx6TkuY5FOcBBP+4OflJ5gM=
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, Potin Lai <potin.lai@quantatw.com>, linux-kernel@vger.kernel.org, Potin Lai <potin.lai.pt@gmail.com>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Add new IOEXP nodes and revise the line names.

Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
---
Potin Lai (2):
      ARM: dts: aspeed: catalina: add pdb cpld io expander
      ARM: dts: aspeed: catalina: update io_expander7 & io_expander8 line name

 .../dts/aspeed/aspeed-bmc-facebook-catalina.dts    | 135 ++++++++++++++++++++-
 1 file changed, 133 insertions(+), 2 deletions(-)
---
base-commit: 471e7c75d0e5c2bf1d65e384b48f625a59ceed45
change-id: 20240823-catalina-ioexp-update-36efd64daf89

Best regards,
-- 
Potin Lai <potin.lai.pt@gmail.com>

