Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AC475483C2
	for <lists+linux-aspeed@lfdr.de>; Mon, 13 Jun 2022 11:54:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LM6NM0vjFz3cBh
	for <lists+linux-aspeed@lfdr.de>; Mon, 13 Jun 2022 19:54:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=fY6zN5C+;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52d; helo=mail-pg1-x52d.google.com; envelope-from=potin.lai.pt@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=fY6zN5C+;
	dkim-atps=neutral
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LM6NB46pvz3bl3
	for <linux-aspeed@lists.ozlabs.org>; Mon, 13 Jun 2022 19:54:02 +1000 (AEST)
Received: by mail-pg1-x52d.google.com with SMTP id h192so5094546pgc.4
        for <linux-aspeed@lists.ozlabs.org>; Mon, 13 Jun 2022 02:54:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=/cXVElxHAcvgbTqkcDPEZcgMxgzQCWHYrFhvr/zy9d8=;
        b=fY6zN5C+bBWs5V8Mu3xSpbjQPxb5GNgJwzl0WAfablo8FG8nwL3VJfXEB9Z5f4garM
         HecCZm+crzpugtGg0XDvPayO9KSCf1zck8RMhSckWz41R1jDpBPCr8yCITFF3Dlc9qFg
         KMvkm4qFzFC6enlW1HkV0zr1MUDNbt+X8oHj0VBPzOhFYGCMjyWxHSRchgBvOXa9kpNY
         x53pqaylUrni+sLBr3pPvBOv+2RdqRhou023bztWj9pHXDQi4nJa2Yf0Qo/BhN6ZeuGJ
         EwWsQra/5hlM9r7Tt4NK/NsbM2/QNMim6ikGa87b9JlTUwPiiXjpgxc2arZBdeQFMTDr
         XGig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=/cXVElxHAcvgbTqkcDPEZcgMxgzQCWHYrFhvr/zy9d8=;
        b=55JMk40x5GWV6uVbcT73qEk5kTmEjGcuiqi1bmmULjP1rV8z1oml0Uqkw+O0FsRDSV
         8yAgYqxM+xfSXItE109wDwbBY/EiEaSH2cLqVtBescuBfKU3hmfwvSWg4SxRpz4+/SP2
         iNcxijVkxVtzec/QSxHTWPpRBr9BrIaMiy/5WFgrUHTXyuipjCWea/uUcaFtT9x3mv/I
         ByKNvJnWXXvryLWL8bLohUdtAzzaieWyXGrUR05ivy1hV7IehTcNHxFTcQUADVtJTTTN
         jZQ94qnyWBIJRcWhvLVBNQ/sSrkP9YTKkgmzRJ+VJAzUymbtpIYzCAAiQ5xYj2xv4AJ7
         rRpg==
X-Gm-Message-State: AOAM531rwRZAV+vtRqOPfLiwXeDeY6ocTTuqMSA8Jb0Ufte95VlIGzRh
	uLTj3Ee1O3HE4kXT8b6hw3A=
X-Google-Smtp-Source: ABdhPJyGCEMsQN9qDf3iwARJOkhFXJADJBx5omweDUlEcjVMzYEnFVPENmPbWF1LT76ms1Ryy4fHOQ==
X-Received: by 2002:a05:6a00:23c6:b0:51b:f8e3:2e5c with SMTP id g6-20020a056a0023c600b0051bf8e32e5cmr45996931pfc.43.1655114040629;
        Mon, 13 Jun 2022 02:54:00 -0700 (PDT)
Received: from potin-quanta.dhcpserver.local (125-228-123-29.hinet-ip.hinet.net. [125.228.123.29])
        by smtp.gmail.com with ESMTPSA id 19-20020a170902e9d300b001639f038250sm4639754plk.220.2022.06.13.02.53.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jun 2022 02:54:00 -0700 (PDT)
From: Potin Lai <potin.lai.pt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH 1/4] ARM: dts: aspeed: bletchley: change LED sys_log_id to active low
Date: Mon, 13 Jun 2022 17:51:47 +0800
Message-Id: <20220613095150.21917-2-potin.lai.pt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220613095150.21917-1-potin.lai.pt@gmail.com>
References: <20220613095150.21917-1-potin.lai.pt@gmail.com>
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, Potin Lai <potin.lai@quantatw.com>, linux-kernel@vger.kernel.org, Potin Lai <potin.lai.pt@gmail.com>, Patrick Williams <patrick@stwcx.xyz>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

change LED sys_log_id to active low base on DVT schematic.

Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
---
 arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts b/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts
index 41d2b1535d9a..d34bfa50620e 100644
--- a/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts
@@ -59,7 +59,7 @@
 		compatible = "gpio-leds";
 		sys_log_id {
 			default-state = "off";
-			gpios = <&front_leds 0 GPIO_ACTIVE_HIGH>;
+			gpios = <&front_leds 0 GPIO_ACTIVE_LOW>;
 		};
 	};
 
-- 
2.17.1

