Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AD74958489
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Aug 2024 12:31:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wp5NM0YKrz2yG9
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Aug 2024 20:31:15 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::636"
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=FJIQlEqO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::636; helo=mail-pl1-x636.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wp5NJ0LJWz2y33
	for <linux-aspeed@lists.ozlabs.org>; Tue, 20 Aug 2024 20:31:11 +1000 (AEST)
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2020ac89cabso29674755ad.1
        for <linux-aspeed@lists.ozlabs.org>; Tue, 20 Aug 2024 03:31:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724149868; x=1724754668; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=x8KG5dQytcwjdtzpovPzJqJoYJR89MLqDb7pWxZ3Btc=;
        b=FJIQlEqOHCldTAd0CPuXh+w7T1g8A+q2a4ubx/fAkfMUS1qbUeSvoWrjGe9iPA2BOu
         Shwb8M2ZoQSxp839vhdSD0KoaUCcisnlcIMSpAvphkLWvyddDwBYNhUxnkvVbT8QTIRj
         72oISATshkrzoslfimFSVmR9lAxPvKfXoplNOIsqk9jWd7ZIUIdbECxS2ZmJE5jLsidC
         WGcM9yyF8zBQcYdGliIOZ4LhkbUAd3J6Y3eGb1GF8sTMX1suOLLU/TzwBId30iZUKgg0
         Hhh6jNDnJpjwMw1eT+ldHY6wF3EA9IQOl53VNuTdVBv4SHkJRD1IMKwxBxiH2GYof8gh
         CeiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724149868; x=1724754668;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x8KG5dQytcwjdtzpovPzJqJoYJR89MLqDb7pWxZ3Btc=;
        b=dGd6NRWwH134FJ5KlW1lblP2U66PLKsjgPwSKRKzCl3ZbmjxFfeZj+RGV8FDiSwoHQ
         y3o7lxy2t3oiaqhob8B5QPe8Ix8aKNdidgMYY4SWE39guM2CX37gPV6JhA27gKXgZpv5
         cW9XhhOaOLM5X+OfVZEpvciusgYN04YhztZgKJI7boVpQtdCwyPKYB0GrTubrmFUbaff
         WhcO8zapgbldzfFv1v3zWZtlWcleSMywbUbgoPNY3P8gE5fjp+JMUaiSI4PF4OmjVps3
         ymabtDjFmoXKXSS/8XnnfoZW+AoyEXBV6voi8II0/ATiSoVN2TOIGsAJfzv1YeK9rDND
         Pwog==
X-Forwarded-Encrypted: i=1; AJvYcCUa3cz2QXEh0m+FjrxN1hJRJXF92b4Ykp83oQh9wKjTcSGPWGIhIpU5PbmmwvL9t6lIDajTNmN5A2Z5geyLVy8D6UCInbdkjImLQX2nIg==
X-Gm-Message-State: AOJu0YwNy3/InZeDb5wwjnZXqYsFL1kzspvMyoUZRvc8MHA3Ezt4pkLD
	knBq19cryRUbnw0JmBDzxKfoJN7Zh+78ipc042xI+v8JuRdXxM7sQBORGA==
X-Google-Smtp-Source: AGHT+IGmvxHmA9LWUK00CwbBTIL4WWWDgRHMSVmTdzRjaleYxC53WdeolERwX2728+kxKkkxxg4tJQ==
X-Received: by 2002:a17:902:eccc:b0:1fd:9b96:32d4 with SMTP id d9443c01a7336-20203f3151dmr117348785ad.51.1724149868445;
        Tue, 20 Aug 2024 03:31:08 -0700 (PDT)
Received: from peter-bmc.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-201f02faa5dsm75444115ad.2.2024.08.20.03.31.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Aug 2024 03:31:07 -0700 (PDT)
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
Subject: [PATCH v1 0/2] Revise Meta(Facebook) Harma BMC(AST2600)
Date: Tue, 20 Aug 2024 18:29:01 +0800
Message-Id: <20240820102904.1756785-1-peteryin.openbmc@gmail.com>
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

v1
  - Patch 0001 - add rtc device
  - Patch 0002 - update sgpio line name


Peter Yin (2):
  ARM: dts: aspeed: Harma: add rtc device
  ARM: dts: aspeed: Harma: update sgpio line name

 .../dts/aspeed/aspeed-bmc-facebook-harma.dts  | 27 ++++++++++++-------
 1 file changed, 18 insertions(+), 9 deletions(-)

-- 
2.25.1

