Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2973039D34D
	for <lists+linux-aspeed@lfdr.de>; Mon,  7 Jun 2021 05:13:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fyz3J4R6nz3049
	for <lists+linux-aspeed@lfdr.de>; Mon,  7 Jun 2021 13:13:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=q4Rh802W;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::633;
 helo=mail-pl1-x633.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=q4Rh802W; dkim-atps=neutral
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fyz394Fr7z2yXX
 for <linux-aspeed@lists.ozlabs.org>; Mon,  7 Jun 2021 13:13:24 +1000 (AEST)
Received: by mail-pl1-x633.google.com with SMTP id x10so7855742plg.3
 for <linux-aspeed@lists.ozlabs.org>; Sun, 06 Jun 2021 20:13:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0gXR47yl4Xfai+uR9bdpI8wWNZEQFRwXmQzpYmjltTs=;
 b=q4Rh802WIXFIzSm1ep4yKdxY26hc3DtgbdE8Fg2hyZeGm0ce+N3egNUfxP6t3JsvcP
 lOuYt67ip/smImNfJ5gCD6jcaTx3BYYEYQwRFbxnNmbng2X7Qms/28iyGDVx3bqTcfSX
 fn7AaKKg6g3Fnfcxwuj1F3vK1THiwtb6AfnmIzlk9KSBvbR+pFSooN88Wi6QYVscd10/
 /64efrORPsbct0j8RkGZLwdlupSCwozt9ljPAVw7+IQd5YJA+3eLLhB+2FMuNNbxWk8T
 2rkBXckvEg643KxG8e9CW8gNaOfE5EII8CdZ/fX8uiJA3sX3h3/im1ILZeWguhs/Wg+M
 lNQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=0gXR47yl4Xfai+uR9bdpI8wWNZEQFRwXmQzpYmjltTs=;
 b=GbVDpEvQShXRayE/iYFfTYCMhzfA+WsVPcH1Yl8+sh+qZkp80G8jusESXFW7fIef0P
 8qa0eD7kaDEEhk5R0uVjQs9JZaAxZQzJJIVTg42tP5IxNdhHiRSmPXzqsg3qidyZVcIS
 5OlWwuM5bL6OkmPf/yRXAVmgs1b+UpMYVGxbRxqa3yO3TAFWdYpZWHzMqOvgsmpgUsDI
 Ia1wl+Xspx4M11mXyavnKwIaTZxTrysUvF+C7mLGnmAjDFdK1w0ViOLz5sgxSTL1fiO/
 w9WWj3+oWMoeWtPUmoxKkIPsuISI53oK7Jayq+MeGTTPO7jSVH2cLP7JU9Fh9/tWBwOB
 /L5Q==
X-Gm-Message-State: AOAM531V1+dU7lNs+CCy8jDF0jX9u38zref+riH/Vm3YUrrIOqC1LQ95
 gGxmjzb3aJi17RilCe5CMd4=
X-Google-Smtp-Source: ABdhPJzSHkb3l0s9JfORZdCI4jOZxr7/Z6Fwh/1t1kIe0pE9U8C550cAq7kIPc3J/+j8ik18EGKRxQ==
X-Received: by 2002:a17:902:ed0c:b029:104:8397:3376 with SMTP id
 b12-20020a170902ed0cb029010483973376mr15847666pld.60.1623035599895; 
 Sun, 06 Jun 2021 20:13:19 -0700 (PDT)
Received: from voyager.lan ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id x33sm5763751pfh.108.2021.06.06.20.13.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Jun 2021 20:13:18 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Andrew Jeffery <andrew@aj.id.au>, Eddie James <eajames@linux.ibm.com>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: [PATCH 0/6] ARM: dts: aspeed: Add Everest LED descriptions
Date: Mon,  7 Jun 2021 12:42:53 +0930
Message-Id: <20210607031259.475020-1-joel@jms.id.au>
X-Mailer: git-send-email 2.30.2
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
Cc: linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

This describes the various status LEDs attached to expanders on the
Everest system.

Vishwanatha Subbanna (6):
  ARM: dts: aspeed: everest: Add system level indicator leds
  ARM: dts: aspeed: everest: Add nvme and fan indicator leds
  ARM: dts: aspeed: everest: Add pcie slot indicator leds
  ARM: dts: aspeed: everest: Add dimm indicator leds
  ARM: dts: aspeed: everest: Add vrm and other indicator leds
  ARM: dts: aspeed: everest: Add pcie cable card indicator leds

 arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts | 1997 ++++++++++++++++--
 1 file changed, 1866 insertions(+), 131 deletions(-)

-- 
2.30.2

