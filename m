Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 61D57691828
	for <lists+linux-aspeed@lfdr.de>; Fri, 10 Feb 2023 06:55:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PCjdM20Nkz3cfj
	for <lists+linux-aspeed@lfdr.de>; Fri, 10 Feb 2023 16:55:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ufispace-com.20210112.gappssmtp.com header.i=@ufispace-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=Qvu8XDbw;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ufispace.com (client-ip=2607:f8b0:4864:20::531; helo=mail-pg1-x531.google.com; envelope-from=jordan.chang@ufispace.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ufispace-com.20210112.gappssmtp.com header.i=@ufispace-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=Qvu8XDbw;
	dkim-atps=neutral
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PCjdC5zpDz2xb4
	for <linux-aspeed@lists.ozlabs.org>; Fri, 10 Feb 2023 16:55:27 +1100 (AEDT)
Received: by mail-pg1-x531.google.com with SMTP id v3so3044973pgh.4
        for <linux-aspeed@lists.ozlabs.org>; Thu, 09 Feb 2023 21:55:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ufispace-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5R8hvmo1SVb1s6mNEy4BWSCFUG+Ltq9LTM/O0gN9JTA=;
        b=Qvu8XDbwAoU+4V0C/PwipW+1Uf5O/8FwlfMwq61WCx6k5e/bBImJSRtpnx4kusuXM5
         2LM9XBvyBARZAc/Is5l9DS3fofjPTZeKdT3Mz2MktglLapOFWnSjNHAubZPRlqKsqlII
         PvKbuSBp5IdwIZX9JQDq8NfR2hgZYaNrDwq845SrbkkuuQinR7KB5LOu7LgJ0i63NjM1
         rjexybfIVnz1X4Sk3/J1WgjK5nNhahp0QfChy/HGJCkBBtEJ9TPMfbVbD5gPJO62GtDX
         rVmx/8Dukt4cA/DHCEoymCRaVigogMEbIj+69yFQWagauFyBepe6AAaekfDIIT23OgYJ
         xlaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5R8hvmo1SVb1s6mNEy4BWSCFUG+Ltq9LTM/O0gN9JTA=;
        b=L6DUIDCvXY1SqbHihCInjVyJp+nvfyL2GzjLzC4ruaVH2PkYXBjNF2vd7Gy8Nouojr
         Zvf9anaMZkNvjKtGN7PHJ00Q65gd7RIte0sCFmvQrmx4rH/c0U6pQRwnIvPnlNT7oxwK
         c+3AILfMxHRthGJnNTvNxjeKBqH1qL6P4VFWJeLtbcMDMNrkB6AxaNC5F8QCEaiKbT9N
         Do9wkgA5YC1BMDoPEBdibJ6I648UGubKR+FqCd7VJxEY3hgbw0tMMc/UV8y1c4hqhIJj
         aEvhdPwsksBA8LBPstwjczmUDS51flq0qhBOiOpVazWhO8RvNHTftoSkKYOFNQFZLYXX
         PBbA==
X-Gm-Message-State: AO0yUKUZKCrimq08okWgV7iNaecrOr4EBobki7TXogkfn0/o1f1oXezj
	E7CIiSgwaZTfqTTlBVSUU6Ca/A==
X-Google-Smtp-Source: AK7set+xT5c3xbXiG/94Jkde+1ghokb32sfN6po8ViWkWFxdA0hCSqgnFQTaTbNpUcDHbuVAgMPKdg==
X-Received: by 2002:aa7:843a:0:b0:5a8:4e65:80a9 with SMTP id q26-20020aa7843a000000b005a84e6580a9mr5515134pfn.5.1676008523556;
        Thu, 09 Feb 2023 21:55:23 -0800 (PST)
Received: from openbmc500G.LAB.ufispace (CH210-63-217-225.static.apol.com.tw. [210.63.217.225])
        by smtp.gmail.com with ESMTPSA id f15-20020aa782cf000000b005a84de344a6sm2500025pfn.14.2023.02.09.21.55.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Feb 2023 21:55:23 -0800 (PST)
From: Jordan Chang <jordan.chang@ufispace.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	joel@jms.id.au,
	andrew@aj.id.au,
	robh+dt@kernel.org
Subject: [PATCH v3 0/3] Add Ufispace NCPLite platform device tree
Date: Fri, 10 Feb 2023 13:54:48 +0800
Message-Id: <20230210055451.72153-1-jordan.chang@ufispace.com>
X-Mailer: git-send-email 2.39.0
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
Cc: jay.tc.lin@ufispace.com, eason.ys.huang@ufispace.com
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Changes for v3:
- add "Acked-by: Krzysztof Kozlowski"

Changes for v2:
- modify node name to generic one and check with dtbs_check
- send-email without confidential mode

Jordan Chang (3):
  dt-bindings: vendor-prefixes: Add prefix for Ufi Space
  dt-bindings: arm: aspeed: document Ufispace NCPLite
  ARM: dts: aspeed: Add device tree for Ufispace NCPLite BMC

 .../bindings/arm/aspeed/aspeed.yaml           |   1 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm/boot/dts/Makefile                    |   1 +
 .../boot/dts/aspeed-bmc-ufispace-ncplite.dts  | 359 ++++++++++++++++++
 4 files changed, 363 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-ufispace-ncplite.dts

-- 
2.39.0

