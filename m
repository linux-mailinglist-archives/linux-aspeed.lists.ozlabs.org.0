Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 57A058216FC
	for <lists+linux-aspeed@lfdr.de>; Tue,  2 Jan 2024 05:47:10 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=FLtXj4xN;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T40gw0K4Kz3bnv
	for <lists+linux-aspeed@lfdr.de>; Tue,  2 Jan 2024 15:47:08 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=FLtXj4xN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::c29; helo=mail-oo1-xc29.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oo1-xc29.google.com (mail-oo1-xc29.google.com [IPv6:2607:f8b0:4864:20::c29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T40fx61C7z3bX5
	for <linux-aspeed@lists.ozlabs.org>; Tue,  2 Jan 2024 15:46:17 +1100 (AEDT)
Received: by mail-oo1-xc29.google.com with SMTP id 006d021491bc7-595471d17baso436092eaf.3
        for <linux-aspeed@lists.ozlabs.org>; Mon, 01 Jan 2024 20:46:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704170773; x=1704775573; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=WadGb93wcdGqbFMpgW0CWGdc7fJXwJMMfPquKTGcV6o=;
        b=FLtXj4xNmwIBiy5KRHgZlY9ls8CaNKHJtsz/evYACStkuJ9hOZVyz5KK3L+AFHLIRq
         w6gS3tS3Kap5DNb3ffNYK3VnElQkKHvoXT4mxT6cgAASEm5N3rBaB1RPYl2ntFDUMVS5
         YSd2YVM7tQz6frdx2Xio0WK8MQcngBm10H6AZwNj7DNS5QTsT3vGbNypmpolE4J5UdCa
         /E0RUD81fx6uQt2AV2LnrlyIvJgxCJg8MnBpSFVN72UYRfIPAtqHCWLJw4N0y67hDVLq
         aKk1BcCH9OPUDVjaeb4HLoiQKYNWkjNZvpR3+AIVdJFVE1xCjIU3bZiLBR8KPc3xTndx
         MdIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704170773; x=1704775573;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WadGb93wcdGqbFMpgW0CWGdc7fJXwJMMfPquKTGcV6o=;
        b=m/H1ncb0cKyWbgEh4/FJ3E8Eq/ZSSDXt1K4buKvKNAgE8Hs0hsDPdXtnu5u3KBiaX2
         ocs2YBtKOONRI0lv0W9UfCq9xjla0YEvZnOXPBp0AXN8Ad7lSGiRv7BADTBBX5aLW3k8
         Jj2OUiySP0Mn3WSgzFuTwaZk79n/hz0M8BXHd+acdVbdLd/1WzHgBIOOC9PHmqYtrtRc
         PPPLet8u0S07gZT3synyh+8hM8dptaU/kfXi+HyOIMWJAeI6gjVYhE8zLs+jhXbcT3Pm
         gLxqEGIFWy3Y2IMXIzLzkim6aFDyw6+Tnj14yWNSJJ3fZ1gATLu+GarbSZJ9tTungKjA
         aedA==
X-Gm-Message-State: AOJu0YxGkXJjl/UToj+BLTd/b9jtvXDL34ki4Iw8XT4LK9MBeIRNRSMw
	NTBqC/Wx+4soakoKNL3yT4w=
X-Google-Smtp-Source: AGHT+IGJLGIyXfa0cwAT3dmM5lPGsGGqjHONG9Hq4FkGUf6JDZ8upsGNJ+Bksprs4p7mlqvCuKWsJg==
X-Received: by 2002:a05:6359:2e9f:b0:172:d67c:61ce with SMTP id rp31-20020a0563592e9f00b00172d67c61cemr7454495rwb.9.1704170772880;
        Mon, 01 Jan 2024 20:46:12 -0800 (PST)
Received: from peter-bmc.dhcpserver.bu9bmc.local (1-34-21-66.hinet-ip.hinet.net. [1.34.21.66])
        by smtp.gmail.com with ESMTPSA id d21-20020a17090abf9500b0028c2b2b76c0sm17308392pjs.22.2024.01.01.20.46.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jan 2024 20:46:12 -0800 (PST)
From: Peter Yin <peteryin.openbmc@gmail.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/5] Revise Meta(Facebook) Harma BMC(AST2600)
Date: Tue,  2 Jan 2024 12:44:04 +0800
Message-Id: <20240102044409.3810873-1-peteryin.openbmc@gmail.com>
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

Base on : https://lore.kernel.org/all/CACPK8XePx+PvDKzPMjPRn_g9z8yrtAmLvP8Qbepm1AVjuCbaKw@mail.gmail.com/

Change log:

v1
  - Patch 0001 - Revise SGPIO line name.
  - Patch 0002 - Mapping ttyS2 to UART4.
  - Patch 0003 - Remove Vuart.
  - Patch 0004 - Add cpu power good line name.
  - Patch 0005 - Add spi-gpio.

Peter Yin (5):
  ARM: dts: aspeed: Harma: Revise SGPIO line name.
  ARM: dts: aspeed: Harma: mapping ttyS2 to UART4.
  ARM: dts: aspeed: Harma: Remove Vuart
  ARM: dts: aspeed: Harma: Add cpu power good line name
  ARM: dts: aspeed: Harma: Add spi-gpio

 .../dts/aspeed/aspeed-bmc-facebook-harma.dts  | 33 ++++++++++++++-----
 1 file changed, 25 insertions(+), 8 deletions(-)

-- 
2.25.1

