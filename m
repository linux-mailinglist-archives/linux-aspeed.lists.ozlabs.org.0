Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D80A939132
	for <lists+linux-aspeed@lfdr.de>; Mon, 22 Jul 2024 17:01:23 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=PJQS/wFb;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WSNlN6vH8z3c2K
	for <lists+linux-aspeed@lfdr.de>; Tue, 23 Jul 2024 01:01:20 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=PJQS/wFb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102d; helo=mail-pj1-x102d.google.com; envelope-from=potin.lai.pt@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WSNlH0ksWz2y8f
	for <linux-aspeed@lists.ozlabs.org>; Tue, 23 Jul 2024 01:01:13 +1000 (AEST)
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-2cd1661174cso1287521a91.0
        for <linux-aspeed@lists.ozlabs.org>; Mon, 22 Jul 2024 08:01:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721660471; x=1722265271; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LifFp8za0/fDe/DMyUuD2kVYz+L5AS9snMHlQAxSzgg=;
        b=PJQS/wFbXBy3pC0PfOwsDaRc03rZcLFglYcw+0JMMz8ZbgpHz32/Sp5RAHgJ5YL8q+
         tJmTFZQICK1Ky5eQvt3PJZoWfS9a3MS55320Ho8zd74qeLT3pgIAtA8H0CuCTpp0+/Xo
         eSU8SfFC3i4iE1ZaOFBoi0LpKOCbuv+8g9khWeOgDho6TJhZTqX7SLuFRPvzn1po/W24
         21dkwqxtksNsXN8EjadnUUKKFOjrEYEtrg2E3+DC1AKhyVe2HhiGuXxA0E4EyzfR46sl
         ghUZAaEYxLYQUSxG5CeULQijsccvAbgm6lQwN3eQq8MGSEWXRLxCpAof+jxUmBvGY7yB
         9kgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721660471; x=1722265271;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LifFp8za0/fDe/DMyUuD2kVYz+L5AS9snMHlQAxSzgg=;
        b=D7jheM/9luV5XtY2w6B//GZtX98C2X9CZc/faXrEvdqSTIUWKySiS1aA4wH/XNwHKw
         rxN0PkaX9XCUf108NogfkdqbT9Qg1U00AxnOyzEB1LtJ7dVCc7wkdA/nuZucnfw1VazE
         IEslwXi/gIlbighvzYUg4ZsmvcxfNMpyDfxcpm2dc/NmJA9AN6/ml3Lq695yA5PZSX1s
         raJiiXiMUF9HLf0GVXDNF40aG9F/ejyv8gAdl0BUmy69VMnUzBrcGS/LSMwMhZ98ZY1G
         19SHvQIMvQW7MSQ5icONp1TXT0GirFL7cAEyJbIxC2OqNW3IXlwYtHtYE+/B6hwqY6nc
         X0Vw==
X-Forwarded-Encrypted: i=1; AJvYcCVL+capBfSfNGnP3hlGL+r4zySLz1xlLcs3vFF6Pc7zpsvieWJqP9FunKw9PfsDNlBxw57voDaMfdJBVE4C8d/cX21NPcEXqxaflEX1pg==
X-Gm-Message-State: AOJu0Ywvw5Wtm+d9kM4CQp6TMy6wqXQQkIDNPoycdtsQXqeWa98vzkyd
	qEPw4r8rNmTZV/PNX0HRC3cvgycP2ept7l81LuieXdEJhEn5SIyL
X-Google-Smtp-Source: AGHT+IHp0kMpE5js4nkQXc2GMSlg1Q0sPAxE54CT3VyYZOAoOxlisjAmUKLKIXkE8VYoyJ2O+rqSkA==
X-Received: by 2002:a17:90b:3d0:b0:2c9:5a87:f17c with SMTP id 98e67ed59e1d1-2cd2740f285mr3469822a91.15.1721660470911;
        Mon, 22 Jul 2024 08:01:10 -0700 (PDT)
Received: from localhost.localdomain (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cb77304a15sm8224207a91.19.2024.07.22.08.01.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jul 2024 08:01:10 -0700 (PDT)
From: Potin Lai <potin.lai.pt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Patrick Williams <patrick@stwcx.xyz>
Subject: [PATCH 0/2] Add Meta(Facebook) Catalina BMC(AST2600)
Date: Mon, 22 Jul 2024 22:58:55 +0800
Message-Id: <20240722145857.2131100-1-potin.lai.pt@gmail.com>
X-Mailer: git-send-email 2.31.1
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, Potin Lai <potin.lai@quantatw.com>, linux-kernel@vger.kernel.org, Potin Lai <potin.lai.pt@gmail.com>, Cosmo Chou <cosmo.chou@quantatw.com>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Add Linux device tree entry related to Meta(Facebook) Catalina specific
devices connected to BMC(AST2600) SoC.

Potin Lai (2):
  dt-bindings: arm: aspeed: add Meta Catalina board
  ARM: dts: aspeed: catalina: add Meta Catalina BMC

 .../bindings/arm/aspeed/aspeed.yaml           |    1 +
 arch/arm/boot/dts/aspeed/Makefile             |    1 +
 .../aspeed/aspeed-bmc-facebook-catalina.dts   | 1032 +++++++++++++++++
 3 files changed, 1034 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts

-- 
2.31.1

