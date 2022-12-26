Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 246DB656036
	for <lists+linux-aspeed@lfdr.de>; Mon, 26 Dec 2022 06:48:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NgRdp0HNdz3bfG
	for <lists+linux-aspeed@lfdr.de>; Mon, 26 Dec 2022 16:47:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=byes3/YM;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1032; helo=mail-pj1-x1032.google.com; envelope-from=potin.lai.pt@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=byes3/YM;
	dkim-atps=neutral
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NgRdg6z6Zz2y6F
	for <linux-aspeed@lists.ozlabs.org>; Mon, 26 Dec 2022 16:47:51 +1100 (AEDT)
Received: by mail-pj1-x1032.google.com with SMTP id m7-20020a17090a730700b00225ebb9cd01so2059642pjk.3
        for <linux-aspeed@lists.ozlabs.org>; Sun, 25 Dec 2022 21:47:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uLSvcKUr/LzSUoeSULqWf9KKBJSvPiEYMba+dOztS9o=;
        b=byes3/YMeMFY8pdHEKz8Gs/g8Yy7sGiGQ4Y6gjhniUhuANAyCrF3y06fynIumCQosc
         esDeoH0ocS1+LUY8jCkoxZ3aDFxyiItmohAl77wacBOEgwMO5+Yuv4Yycx3akTapUiQt
         AYJNf8Z7wysPsQApsaNsZNw1OwjMIgPvDkT7MMjy7dHLe8DHxf7PpvIfIUWaE+BgPG3b
         05doglK0ZFJDMOs3sWhbbFl6rVZclTJ4EEsDiqWCCinCorxxX4Fe685tds1pAnY6DiH8
         fFRlzm0lQviQ6Y2iTakjaFSxccIJ5KBreqSv+PRdPIKkR3ZfUiZxrOi4AgUO6ocWAKCL
         lOUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uLSvcKUr/LzSUoeSULqWf9KKBJSvPiEYMba+dOztS9o=;
        b=6neOz9IupD8WDNvfoVCidSsXs9UeusrS0jnEQmgwqZ9l7Po2aURgamRgJyz6ftdPm5
         8RnXGFW83ph309BW6+8+0NkptnimdBvkbiMVOz1NJZnRrZ8u41aAiFoGtnN8k6raLrq9
         ubhx/knkgrHf6OhfXxsywhN0/LATabqjGvHT2OdwkE090PWUMdd30Y4m3DNVr9rzTIhU
         0IQ/Sv/Z2gxDgbASHP9PYZME34udLcak4GNTwuy0tQi6pjlbhyUINyO89wEE6gulM0Vf
         VQXuacVxrCQYmhWqt1zqvmAGEB3GEqSRICi8PzVJLGJE18XbAJ3gH8+rA4190H8lF5jY
         cNyg==
X-Gm-Message-State: AFqh2kqVVpbrryQlp5KqI5AKtYFnm18Xueq8ai0x0TOtUuxWMUmaZ2j1
	tbUVQtnosNsTCaCu0XGDps0=
X-Google-Smtp-Source: AMrXdXuBted3i4+UVKCqyGp2Q7zGVCsdurIC+MAFR9FedgpvSKF7wRz2qQ87sbh7EYngvNMpWlHARg==
X-Received: by 2002:a05:6a20:9e05:b0:af:9391:449 with SMTP id ms5-20020a056a209e0500b000af93910449mr21599493pzb.45.1672033668239;
        Sun, 25 Dec 2022 21:47:48 -0800 (PST)
Received: from localhost.localdomain (1-34-79-176.hinet-ip.hinet.net. [1.34.79.176])
        by smtp.gmail.com with ESMTPSA id h35-20020a632123000000b004785d99321asm5618242pgh.86.2022.12.25.21.47.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Dec 2022 21:47:47 -0800 (PST)
From: Potin Lai <potin.lai.pt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH 0/2] ARM: dts: aspeed: bletchley: Update Bletchley devicetree
Date: Mon, 26 Dec 2022 13:45:33 +0800
Message-Id: <20221226054535.2836110-1-potin.lai.pt@gmail.com>
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, Potin Lai <potin.lai.pt@gmail.com>, Patrick Williams <patrick@stwcx.xyz>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Update Bletchley BMC devicetree.

Potin Lai (2):
  ARM: dts: aspeed: bletchley: rename flash1 label
  ARM: dts: aspeed: bletchley: enable wdtrst1

 arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

-- 
2.31.1

