Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 57EBA965CA8
	for <lists+linux-aspeed@lfdr.de>; Fri, 30 Aug 2024 11:24:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WwCQ81Nn3z30GV
	for <lists+linux-aspeed@lfdr.de>; Fri, 30 Aug 2024 19:24:00 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::42c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725009838;
	cv=none; b=DXN19ICQRYDdrnpt2kaLBCMQDAOKh772MsEpSzklmm6SgVzYvaAiDXCK80yiO6r5Gsd77R7O8Z7XVAELPFBfvg5fCFIyHmGKzC03s+wWCoGpSFvLV9QjXoaKbqwYOW7o5Pb2MVy6cNNZaCersZXYeJL4YfgvYDjSnM6OyAZ0k0oFitUOxRj5oTPprJ0fjPtwoUkgcfg3qjXOJExIgH+rw7W+GaW4n+zCedy7YIvkEp2jnZDpB1NP5QjZxZN3JQgVzX0M5duiftttDg0Bu1EumEyGylrXbDC0NvRw+Pyztxv5BGXxbOe3gtcSMiuMjw+HUmCPucj/s0pS7rVZA4fRYw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725009838; c=relaxed/relaxed;
	bh=24ONLHDIg4IPXcssauearHwBYBXH9GZM3HUtiuvktw0=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Google-Smtp-Source:
	 X-Received:Received:From:To:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding; b=K8vyJpqppCvP8HT260PUfK+zzDzJrKrcBDA5l4oIf/gUerFkH+oEEfGotZPwmN7u8KqORjl4OXakzvDeT2PUuneBjKDiDMOnOQM4RjkRSS1CMggyXkVn99SKDuM9SVWsZnvFDP1q8WSHvQthvk6E3ehO759Du/ucYr74odQkE8quf2SuIZdh86695yMVB1gzuYmIWd3i2eGelzTN9HCoc9ld86Nrsad3RNIfaIzydpvCAJrnpHp4SZ6dR+chxpttLEOEikUdh4jpzdlFBnMCTsTelNUJMbTTIBAPgjOGPhCwbhjV6VJf+jbzc5SSNdbNp1vX0lt/ZFa5nLeWQZsviQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=AVVa3V+K; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::42c; helo=mail-pf1-x42c.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=AVVa3V+K;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42c; helo=mail-pf1-x42c.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WwCQ52BCvz304x
	for <linux-aspeed@lists.ozlabs.org>; Fri, 30 Aug 2024 19:23:57 +1000 (AEST)
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-71431524f33so1196141b3a.1
        for <linux-aspeed@lists.ozlabs.org>; Fri, 30 Aug 2024 02:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725009835; x=1725614635; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=24ONLHDIg4IPXcssauearHwBYBXH9GZM3HUtiuvktw0=;
        b=AVVa3V+KQxJq8HEqfxilgUmHyC99EVuPG3AONoRZ/kURzdvTOxcIyOhDFkbJj2S2uZ
         JCdhmLzPW4PJIUfwcDQ7NFqiIVk1r7eKnrQz5ybcEFvvFW7zG9Y8w1uH8F0uCKQ2+etP
         EYH3LFRKVDitX7qsxKWN6AJMF2G6HP5vMwnGq7BzbrnePo002LDubSYJAicxeLy5l/7a
         DvwLP5PnoJ+ZUeSH5VYpPj6mRyFNrBdRmbcaUMIrbvZ3Ewy5+28PNBfz5y1q6WTPI57x
         BEyP0hnblCM7FQq6VpFxbmxGUCERGSWKWFWB40DgnaGwe98rxADKo7iuxom7lJwdEKW+
         FIig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725009835; x=1725614635;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=24ONLHDIg4IPXcssauearHwBYBXH9GZM3HUtiuvktw0=;
        b=K5A8F/GztXo5JCMDywQVHhvHPL3QIhUZ9xzfdFj9GD9KR/Iu6a2bEIOA8w6f+aZ4M9
         LIe2+vbM+/7BrVrlX/3oLEbBd3O3Zf7Jvn2z4BM6SQccBRkVlCsSpseJT+GUOeGoZTBi
         vVzdK3doDZfYkREJGPdfztIoj9ZhCTALTENOcqQzYDPxGlqXjirlUNGeo29k+EeLeYsu
         t4Z/VOGSfQCmroWHDE/tfJIbyz0TiQbcNW5rL/hq6dnu8pwBh2k01uufG/JYu4cFv24a
         7730d6TNr6Bjwr7xNoeUdhz9hXcnLJJQRXUvMFmNd6jFyoD8hvjEiCF47Zc+GI9Z4L8I
         XVdg==
X-Forwarded-Encrypted: i=1; AJvYcCVXp/sgv4WuCN1rLEyqoBirDiD+grJcKERXF17vmlm0iWuT1ILTo/UXJv4hGRKsDJNsdDgoHwE1mYSIr+o=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyqX870qRfnE7hXb9jkaol2FFv8Nd4to9BW0QSIxZSnQtxyAtPe
	ZzeyVlrI6HFYeVhks/z+q4c2fDVdvIc6fdMlbISmT8Fsvn/8qjVA
X-Google-Smtp-Source: AGHT+IHVds/gNBeqiQw80n4Y1TOS9j/5h8Ndwc6d6YZI5Jzr6qTP18YyB5qpXOuOINGKTBpa6o8eng==
X-Received: by 2002:a05:6a00:6f13:b0:714:2198:26bd with SMTP id d2e1a72fcca58-715dfb46bedmr6360284b3a.11.1725009834948;
        Fri, 30 Aug 2024 02:23:54 -0700 (PDT)
Received: from peter-bmc.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7d22e66d8f4sm2566744a12.0.2024.08.30.02.23.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Aug 2024 02:23:54 -0700 (PDT)
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
Subject: [PATCH v2 1/2] ARM: dts: aspeed: Harma: add rtc device
Date: Fri, 30 Aug 2024 17:21:46 +0800
Message-Id: <20240830092148.1574520-2-peteryin.openbmc@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240830092148.1574520-1-peteryin.openbmc@gmail.com>
References: <20240830092148.1574520-1-peteryin.openbmc@gmail.com>
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

Add "nxp,pcf8563" device and the slave address is 0x51.

Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
index cf3f807a38fe..92068c65eae4 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
@@ -135,10 +135,6 @@ &mac3 {
 	use-ncsi;
 };
 
-&rtc {
-	status = "okay";
-};
-
 &fmc {
 	status = "okay";
 
@@ -506,6 +502,11 @@ imux31: i2c@3 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <3>;
+
+			rtc@51 {
+				compatible = "nxp,pcf8563";
+				reg = <0x51>;
+			};
 		};
 	};
 };
-- 
2.25.1

