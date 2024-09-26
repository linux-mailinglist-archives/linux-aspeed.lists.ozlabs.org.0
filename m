Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BCF85986D51
	for <lists+linux-aspeed@lfdr.de>; Thu, 26 Sep 2024 09:14:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XDlFv5n8Bz301G
	for <lists+linux-aspeed@lfdr.de>; Thu, 26 Sep 2024 17:14:11 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::102a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727334849;
	cv=none; b=LK3F/R4yJIhzfAnaYeHka0HOil5fBlyVwjBWB+yknAR1UGbrJVwC2SbAVFnfdjy0F1ZnqZJEvqpOpuMp68t+FjDiO0CznJBTMzgYqFbffhzUcl2uUCTTxMCFA9gAoF+PtZJZQ1v62QUOM7t6llbQCxbNu43A8Ahy/645jobkVFJiWjqos69Oub5vjlD+TFFaMG9zxSjvmTo/M940QSHbhgpNJtPnJ33BnJchmzCS60tA/hpSYIdJxQ/YQfz3adSFMlhJ5vxLHilbl5+AT2OI9X2y+EX//Xdua96Z04qps0eCJBL1V96zHBYme5PZz5fHhpAc59ceBHwtvvqmgqXbfg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727334849; c=relaxed/relaxed;
	bh=7wqNgLmR1bM1/a/0TAZ5xKqQL+eMXK/MrnC0321nbcw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LD7gUIhnHmlC0wOvh1UB9pqpBAGZ8a6POEczRHlU2HvKG3W1AR1sY4kq+pn1ckjfxPATJtPcUbbO1deRFwRmVdMovXSVhI/9sO9sGsmXUbWPrA21kgEwJsXR2ozvVNxwtK9dJWzCfVc/hGKFnHcoY1we+oKM2VO48Y4PvTpf3n8mMmYbvbR+k+80WY1CKG8PSQct5uwKDVYtj2zinrmgsIWbochO7tAQcMoj7K17AIUof08Cr9CGMIhbyxGcz7UtJxd3nSneVU0YzkIxI8kH3lNnK7Owj63o8vc4P3TGD3r1qXCfG3SJ7OKPe+lURBQulSh8LRtdVsaAl5DASqZwSA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Xo4S3wDa; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::102a; helo=mail-pj1-x102a.google.com; envelope-from=potin.lai.pt@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Xo4S3wDa;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102a; helo=mail-pj1-x102a.google.com; envelope-from=potin.lai.pt@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XDlFs0qr7z2yps
	for <linux-aspeed@lists.ozlabs.org>; Thu, 26 Sep 2024 17:14:09 +1000 (AEST)
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-2e07e40e7d2so587406a91.1
        for <linux-aspeed@lists.ozlabs.org>; Thu, 26 Sep 2024 00:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727334846; x=1727939646; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7wqNgLmR1bM1/a/0TAZ5xKqQL+eMXK/MrnC0321nbcw=;
        b=Xo4S3wDa/EKkrX+isE5Wp8aHrEsC6+Z0uNpZv1jtVhMoWYhqiHd8Tdj+eTFsHDQYV9
         EcfjSxrLH9OoQGklFlutu0NUq5jE8K5jxKUOh+G2Os43Do0GNmt/nxQ4j2Mah+I4L8HZ
         dZgarsW/9jot/Wp7Q4W1J1QRM2U4LmwC6I9eYQkLxLZKdVjYp8N3MwdYuK4ObbTJ2YoO
         tGm2mHF51Ql0ZHH+6w/643vaOjqfzZsrzYxtTv3ocQNYkrAZlI9upMpJQJjkRvoBgWPt
         Xggp92SQZuxYUwQiNCFU6ieIA0akdOOHzeHOB8pHjUhTDhHPdPgdRWO7VJ1/bkjgyEA0
         zF8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727334846; x=1727939646;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7wqNgLmR1bM1/a/0TAZ5xKqQL+eMXK/MrnC0321nbcw=;
        b=N2fDtlySRgGiALWXal1bpkKjEXjGXRchhxyydr8KsqBD0BsEjuix025foeIimGN2Il
         pXESw6hJcY9qILJYs+1mY7S0722JcPjmxUjWvAv5f6UeInOMYaOcc+9lyD38XCKnqbvt
         A8Oq+elzc+2wtERkRCp+BqFQ1PxYJ8Su0qG+nupjTfr50GTMwsM+wXGgcSPnqC8pOlOF
         A1jgj/gVbgyd9oQkgOBvYBijIMxDjjKL8fznsZoJLV8BW/Nqt5F0//vJkKzp3RC8BFVE
         Fyb57+dALulMdwYKUSwGnfiC9jc2cE74QxWGGPImm0LWpXx+CrCAHY/lKmZ+Bo3udW06
         nOEw==
X-Forwarded-Encrypted: i=1; AJvYcCVBEvc013nkoz+oL3qVGZFq3GoRdlDbnjdDpJZS+C1uR6amxl39QBmacJYugdOslL+foJO/WalDF8Z5Lx8=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yzn68iid0zqOqyYDgk0xl0ZtxIAOsMd07mnbgzpVmci3aN6o6nj
	PM803W03G/MTk7pPgBnW0RA3ARYX85JBLVniiZdQTKYkNEF6xdUv
X-Google-Smtp-Source: AGHT+IEYh2nSeTe3zzqNKgrGHJ8e1eBlUTzjOxox29YM4mDjEZtFBluu5eUVailqsjPHSPvycM1crQ==
X-Received: by 2002:a17:90a:ac0b:b0:2e0:7d60:759 with SMTP id 98e67ed59e1d1-2e07d601129mr4556109a91.3.1727334846421;
        Thu, 26 Sep 2024 00:14:06 -0700 (PDT)
Received: from localhost.localdomain (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e06e1d3e79sm2662906a91.27.2024.09.26.00.14.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2024 00:14:06 -0700 (PDT)
From: Potin Lai <potin.lai.pt@gmail.com>
Date: Thu, 26 Sep 2024 15:10:45 +0800
Subject: [PATCH v2 2/3] ARM: dts: aspeed: catalina: enable mac2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240926-catalina-evt-dvt-system-modify-v2-2-a861daeba059@gmail.com>
References: <20240926-catalina-evt-dvt-system-modify-v2-0-a861daeba059@gmail.com>
In-Reply-To: <20240926-catalina-evt-dvt-system-modify-v2-0-a861daeba059@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Patrick Williams <patrick@stwcx.xyz>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727334839; l=915;
 i=potin.lai.pt@gmail.com; s=20240724; h=from:subject:message-id;
 bh=qaMH6FaJbXf8/AYkvzmXmlQFjLNDwqytNJsNdQ+mCJU=;
 b=LT7B9O51Oo5351FhK5Gq2MJ/NY/CsMS2TDO8OVLZZnlDQyp+JUBozi9NtlUZuUGqrQpj9BWuq
 BQ/7y3jWNd/B9ziuufKoyt+3WwXv0xUuWtjcXBy30v3UYSvITTFguPF
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

