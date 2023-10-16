Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 325427C9D0E
	for <lists+linux-aspeed@lfdr.de>; Mon, 16 Oct 2023 03:49:43 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=Cd5k8yD4;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S80R874xDz3c5H
	for <lists+linux-aspeed@lfdr.de>; Mon, 16 Oct 2023 12:49:40 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=Cd5k8yD4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::631; helo=mail-ej1-x631.google.com; envelope-from=joel.stan@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S80R406w6z2xwD
	for <linux-aspeed@lists.ozlabs.org>; Mon, 16 Oct 2023 12:49:35 +1100 (AEDT)
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-991c786369cso634678566b.1
        for <linux-aspeed@lists.ozlabs.org>; Sun, 15 Oct 2023 18:49:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google; t=1697420972; x=1698025772; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AygaYDzdNsfUrtMjI8jfJpMH6DIvJve2ndUz4ktc4vg=;
        b=Cd5k8yD4GJTldt1okw/ReOfZCL65L4k62Pki6QwfVEJv7SVQL8/GqjGW8n9vD93PIa
         1tBvQA3T7bcSZAnB2RDFxTTDLnxffUAXwTo2oIwdMAfONbSTfRDor+yNMVoHkWGcOiIf
         Ron5P8ZQQYdFr9ywZZAKxbvoS7GbswLnrKMok=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697420972; x=1698025772;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AygaYDzdNsfUrtMjI8jfJpMH6DIvJve2ndUz4ktc4vg=;
        b=Az2w7UYfRF5uPIFas+tmEYxTCYBwvPRw0Zgbz1HHGZMX73KGYlGy8FhdE8NkIRWmjW
         /HXv8GfFACcRXLk/tHgjgAm3kVuHHXf5CkvfqeiS0nkBP6foXDvZIsIIWEC1kx8YFoeP
         npuUEQO2xwIFu3Uj+7xUBnclQIdmWki2wrAts+nKyvNaxoFe4nX8rNs4SH+rNfRuMJJq
         WNokn4CT0s67JVIsDH/46S+ziH9oUF1xIffgaiHEpWtdVI1IrYOJpPQZfcF+78VSWvRN
         HHuDEbFTUSKlT4VraIRZ4JFHDqL08WJE8XlULNXkE7Lf0Mc4+w4MnsdteaM6TchQne2s
         qvgQ==
X-Gm-Message-State: AOJu0Ywuj9aIdFtu1cd6biofhU86YVuvHMWsesWAbSlmT9JKMTWKxyes
	n7Sh5w8JdblSw7Vd4kAwy1YCBVsGoL4xwiF3pEw=
X-Google-Smtp-Source: AGHT+IE1KgPX6n2bsIie/Z9urV9FH0YFU65DNEbPPc884bRzH9997J7lWjXzEqQfj9H1XbmsIZp7+BSlW8EYXZkSILg=
X-Received: by 2002:a17:907:6e9f:b0:9be:7dd3:40ab with SMTP id
 sh31-20020a1709076e9f00b009be7dd340abmr4953225ejc.2.1697420972192; Sun, 15
 Oct 2023 18:49:32 -0700 (PDT)
MIME-Version: 1.0
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 16 Oct 2023 12:19:21 +1030
Message-ID: <CACPK8XcTx9bd7DkguFOZ4qCxk8MJWm-yeNMLGDCnO+wv7dwa1g@mail.gmail.com>
Subject: [GIT PULL] ARM: aspeed: soc changes for 6.7
To: SoC Team <soc@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-aspeed <linux-aspeed@lists.ozlabs.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hello soc maintainers,

The following changes since commit 0bb80ecc33a8fb5a682236443c1e740d5c917d1d=
:

  Linux 6.6-rc1 (2023-09-10 16:28:41 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/joel/bmc.git tags/aspeed-6.=
7-soc

for you to fetch changes up to 0af9e89106c359e531791c3dc2422a16bd40d17f:

  soc/aspeed: Convert to platform remove callback returning void
(2023-10-13 15:04:12 +1030)

----------------------------------------------------------------
ASPEED soc updates for 6.7

 * Move all drivers to .remove_new callback

----------------------------------------------------------------
Uwe Kleine-K=C3=B6nig (1):
      soc/aspeed: Convert to platform remove callback returning void

 drivers/soc/aspeed/aspeed-lpc-ctrl.c     | 6 ++----
 drivers/soc/aspeed/aspeed-lpc-snoop.c    | 6 ++----
 drivers/soc/aspeed/aspeed-p2a-ctrl.c     | 6 ++----
 drivers/soc/aspeed/aspeed-uart-routing.c | 6 ++----
 4 files changed, 8 insertions(+), 16 deletions(-)
