Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B9FB986D14
	for <lists+linux-aspeed@lfdr.de>; Thu, 26 Sep 2024 08:58:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XDkvP3lwbz305b
	for <lists+linux-aspeed@lfdr.de>; Thu, 26 Sep 2024 16:58:09 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::233"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727333887;
	cv=none; b=SHfim74aw/HrovbG1rA3m2cUi6RDL4b5YFFMiKsQ/0hnBcuaPd2ccu7JZCQAMRGirXyj6UVKrTrZcCCLt4MHl3nCWIAIC7q1h55x2UW6RjxfFgsEtVXmxeLJaJn6FVVtJY3Py5PS7jOQDth38nxrNeXODaLP/mA0oVeYU1sgGepB967XSn843tVZ3mZBwZ0Z/RecI+TbbVQdjGNGSeeo5ryml/F+qvil5gEBld8kT56nXrrrIJ/UYd8s/kioZ+phBLVzmJZNPFLoSV1nGWXzLkT4O7aKaFrY0/JnGla4SKVHjJxA0gH6/hrMn5IpAEBav0Fe10bOE0wLVYzcZClVyA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727333887; c=relaxed/relaxed;
	bh=7wqNgLmR1bM1/a/0TAZ5xKqQL+eMXK/MrnC0321nbcw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PhUOy2IAnfIjh55x1MgdEtk/NR45xxzdTtAkGRYUkbrbL0SIVrMePvltIzdUV0Do4vMIwoom6Qg6B0h++sBGpJxZm5dOq8xLfs73lN+Ik+txqQB0h9qHns1unG7qS1zvtBnuBg9zeD5hmTtGyCqdeOPmgh2tWaA4nMJ4QLpfIe0VtqAON2Sk2tShVXOKuJ2JV/73KQn+0TFby6dj0eKHKqU5L/TfuP1X4TqSivVC6zmmAhZTbYNte2usxnrfSlqN3RcRoGWYLXIRpPqrIgvAEy1Y3q2P/QpyLncaHZ0gTPk3eK+U3SmwVjJUwRE3F7Z/qtLksnNLnHeZA+c8yNllEw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=XIriDs1J; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::233; helo=mail-oi1-x233.google.com; envelope-from=potin.lai.pt@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=XIriDs1J;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::233; helo=mail-oi1-x233.google.com; envelope-from=potin.lai.pt@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com [IPv6:2607:f8b0:4864:20::233])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XDkvL4XlKz2yft
	for <linux-aspeed@lists.ozlabs.org>; Thu, 26 Sep 2024 16:58:06 +1000 (AEST)
Received: by mail-oi1-x233.google.com with SMTP id 5614622812f47-3e03d17365bso445410b6e.1
        for <linux-aspeed@lists.ozlabs.org>; Wed, 25 Sep 2024 23:58:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727333883; x=1727938683; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7wqNgLmR1bM1/a/0TAZ5xKqQL+eMXK/MrnC0321nbcw=;
        b=XIriDs1JQDb+amWmQKxcKV6pdOOcZZmHZfdZiub4Xy+yeHi9mvSTyy2BjDXU7IHraW
         FkdDVJHcQMrGkAna7racLwTGGf0gAMr/dUr0clM1D5xcxd8iG84CqpafcAlwOxA1++H2
         9G3Xz8ILQcXf65Y9fGtev6z1irnNZvpcp5jIes/psLDggc+mg2kLDA/Hn2C2oeo5aK7w
         CV4K2hJCTmQzMdBZoXn1BR9Y7aXb7TJ/J/6+Bujd4hL/niMN6jMxug60EaJwt0+azAqL
         ICJP6YH/+IPO+rpKwM7WsYgd16KlX6Q76WqZk1zp6XFL5f5EXPfBReUAU8hIySKrDjnl
         61bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727333883; x=1727938683;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7wqNgLmR1bM1/a/0TAZ5xKqQL+eMXK/MrnC0321nbcw=;
        b=GRtgwLtyW5oUas75n/MXNIZdlbh4gLWIfheDfb7C30BGswK9fmvKw0KbE/xOPJskf9
         bPQOYKYdY4SNmwGyQhD06yVl0F8IjVyxxQjAGy458EMoAnjztOZ/ZbtRPOg/zegfUrF9
         JUvp6ZjRXA0S6XhZCx3jt9cU+zYLj8tlVxSl67WTzxBfxeyzeP/uZoOn7aGDrLA6Y4BJ
         mNOhC4y+MskeJSVp4f27iaJK75jT7rfj+jMOYUzlhpg0tcQyYG/G29OdrsrmcK8k3OQb
         DeCMRa5aNTzoakoEkqFwpr6LNmapNSQWD03mqmOV6oq0sJaMuK2uZsON6Gss3Ol7fO/0
         n2jA==
X-Forwarded-Encrypted: i=1; AJvYcCUbRnsFQ43gst9CIW3PQbJO2exF/LXHuuTI/LKFq293qWVu9obfB3E392qMvUrCOx+4LH5WkwWodEqLfW0=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Ywjwl0XK1mVMrbK7mt49wC+dSV5YDV+tt7zc5Q0sZnuYkTP0xfs
	EafrtrLUrwQGakfUjRqteJVmr94EasgAidi6NgUQ54tjJxBBc6UIbsJErA==
X-Google-Smtp-Source: AGHT+IExtwRMKap/ki+jTEt1XhAoqr5vFbhXHJHkwUvFGy3JawIk4nM3xDeUv7NErMswLHooOsOyJQ==
X-Received: by 2002:a05:6808:3a07:b0:3e2:9e2b:fef9 with SMTP id 5614622812f47-3e29e2c3ebamr3133374b6e.36.1727333882943;
        Wed, 25 Sep 2024 23:58:02 -0700 (PDT)
Received: from localhost.localdomain (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7e6b7c51112sm3656709a12.42.2024.09.25.23.58.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 23:58:02 -0700 (PDT)
From: Potin Lai <potin.lai.pt@gmail.com>
Date: Thu, 26 Sep 2024 14:55:32 +0800
Subject: [PATCH 2/2] ARM: dts: aspeed: catalina: enable mac2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240926-catalina-evt-dvt-system-modify-v1-2-84a27b47040b@gmail.com>
References: <20240926-catalina-evt-dvt-system-modify-v1-0-84a27b47040b@gmail.com>
In-Reply-To: <20240926-catalina-evt-dvt-system-modify-v1-0-84a27b47040b@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Patrick Williams <patrick@stwcx.xyz>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727333875; l=915;
 i=potin.lai.pt@gmail.com; s=20240724; h=from:subject:message-id;
 bh=qaMH6FaJbXf8/AYkvzmXmlQFjLNDwqytNJsNdQ+mCJU=;
 b=kjsqTRVWOKnSyltW1Rdtux/0g6qedqZ2QR9TRaEN8qReI9izCabFeXpEG2aisGkdnbmAlXZKJ
 qDtXN5TTrZQCLNDgJuliAyApV4dtVpJOofdCN1wrbaIXuph23xYpf2B
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

Enable mac2 in advance for DVT HW schematic.

- EVT system:
  - eth0 (mac2): no NCSI
  - eth1 (mac3): with NCSI

- DVT system:
  - eth0 (mac2): with NCSI
  - eth1 (mac3): with NCSI

Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts
index eac6e33e98f4..9502d483e738 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts
@@ -153,6 +153,13 @@ &uart5 {
 	status = "okay";
 };
 
+&mac2 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_ncsi3_default>;
+	use-ncsi;
+};
+
 &mac3 {
 	status = "okay";
 	pinctrl-names = "default";

-- 
2.31.1

