Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D7A4E2F0BE7
	for <lists+linux-aspeed@lfdr.de>; Mon, 11 Jan 2021 05:47:16 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DDh5C0ZbyzDqR1
	for <lists+linux-aspeed@lfdr.de>; Mon, 11 Jan 2021 15:47:11 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102a;
 helo=mail-pj1-x102a.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=MNcSUiuT; dkim-atps=neutral
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DDh4y44JbzDqPy
 for <linux-aspeed@lists.ozlabs.org>; Mon, 11 Jan 2021 15:46:54 +1100 (AEDT)
Received: by mail-pj1-x102a.google.com with SMTP id p12so7030366pju.5
 for <linux-aspeed@lists.ozlabs.org>; Sun, 10 Jan 2021 20:46:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mUoSPZN1/QIMi5tiVO7PYLTfc37ZK0uVVtbwZ2aLaVQ=;
 b=MNcSUiuTdAKuqQCNMXZU2cHeIADQViSawHzTZyOWFdBpWf93r9rQ1Hxy4S5vpqPey9
 FoHlb2ZlWScDP58TFRYyvRI05Rc4QNZ4XhO4HtOPWKPjrTYyEwcKltMPFxgBdas0fpk+
 gKcIGEo+mM3cEbE7ulHDKBKiTwRmWz2s5tkCSPzQG8lHfFGMRIjbcsRXIKmTOeldqP4z
 Hh0uAqA0MJobvH7il94xeTOssyccVbT6Mpb6eV8MOmrEF3T/FQ3wUoRcmm5Z8U57nOKx
 rAs+wIOgH6sz2C69t4S7Oh9yQBJa1OewNpe/RuYdLxa41hz2mMgDKlk13PPiCkYY1fPT
 zP/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=mUoSPZN1/QIMi5tiVO7PYLTfc37ZK0uVVtbwZ2aLaVQ=;
 b=m1MTudq6uP7JI7muegt2E0cUHRsUr2n43t/wQKAescWVnDwqcXNKuFjZgPeZ0mJn4Q
 ymaAZyJFHAfdcOaAW44EjyZXJcpUmVKNMAjAO8SwnN8eZf6/avIxoSo52QmDhXDe7898
 5V/nFf6nnXuF3SCVDR9VTGlzs1TsD7v/G2hXBlqI5I5U9T3DKpqpLD94h2KvzCAM5DJi
 VAwgpp2jO4/xMm400YkAv4g6L/4CTrbnIvBmL4xCxNvHafqhSE23lX9xxvFowzHYoKfv
 61VJaJABJINpOOihy6Z5DXvuZ/yN7Z3S4wnXMgU+IRevORkkXo7TZnme1804kKSludqE
 hkNA==
X-Gm-Message-State: AOAM532RLflr5rt7aUm7dL3lnDzHITrXYViZuMzD4sbqM/DBOYtZgrpW
 GiLxFJQnNvfs/ROMohwZ6GM=
X-Google-Smtp-Source: ABdhPJw+1ZpsVyrUoxzePMeRys2ujlOYloRq31qrKelOXHZxh8OolJTM3Yyo/vvBZiri2qgkGvk9fA==
X-Received: by 2002:a17:90b:fd5:: with SMTP id
 gd21mr16623056pjb.139.1610340411950; 
 Sun, 10 Jan 2021 20:46:51 -0800 (PST)
Received: from localhost.localdomain ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id z6sm17442303pfj.22.2021.01.10.20.46.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Jan 2021 20:46:50 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH 0/2] drm: aspeed: Support more chip families
Date: Mon, 11 Jan 2021 15:16:36 +1030
Message-Id: <20210111044638.290909-1-joel@jms.id.au>
X-Mailer: git-send-email 2.29.2
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
Cc: linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-aspeed@lists.ozlabs.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

The out of tree vendor driver was recently updated to support the
ast2400 and ast2600. These patches begin to add that support to the
mainline driver.

With these two cleanups it should be easier to support different
families of BMC system on chip with this driver.

I will merge them through drm-misc once they have been reviewed.

Joel Stanley (2):
  drm/aspeed: Look up syscon by phandle
  drm/aspeed: Use dt matching for default register values

 drivers/gpu/drm/aspeed/aspeed_gfx.h      |  7 +--
 drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c | 10 ++--
 drivers/gpu/drm/aspeed/aspeed_gfx_drv.c  | 58 +++++++++++++++++++-----
 3 files changed, 56 insertions(+), 19 deletions(-)

-- 
2.29.2

