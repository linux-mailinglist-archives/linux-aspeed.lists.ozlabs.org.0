Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 68F64917D60
	for <lists+linux-aspeed@lfdr.de>; Wed, 26 Jun 2024 12:11:30 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=dZwIFgDA;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W8HXt6GcDz30VS
	for <lists+linux-aspeed@lfdr.de>; Wed, 26 Jun 2024 20:11:26 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=dZwIFgDA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::12f; helo=mail-lf1-x12f.google.com; envelope-from=linus.walleij@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W8HWv0S6bz30VM
	for <linux-aspeed@lists.ozlabs.org>; Wed, 26 Jun 2024 20:10:34 +1000 (AEST)
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-52cdb9526e2so392498e87.0
        for <linux-aspeed@lists.ozlabs.org>; Wed, 26 Jun 2024 03:10:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719396627; x=1720001427; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CODmxJ7WAi/9W5Zp49KBekEucUyPOe+eyV9ajXeTHL4=;
        b=dZwIFgDAk6OrKTzWyIAPmquaHdykmMZS/FEQAl49JR/QGy1OxMc0hm63bzSB5q0eLA
         idek97eNuYJXmqXOf3jTQQ24Bo4Crlz521I5uqgIukDU+cBvnVWHgTy7wqy9SHh2xYge
         Lycmv5tTFMko3w32/BpU+sdcHSVYDFwfYkCMlo+oa40GUTJEi4O7JRVMMwPj3tySLdZ6
         xUwI1B1rhAlzHFl/NDpcSb1PCAWFkYT767wKZIeaMH9DIK7ob0ZNeoUv1R0sufz21FOw
         DJqyWcUbMAvsqWrsuJ6vxUkr0NkLLeYH1Jg4QfAEeLRElBR/mFFLQ0rj83r36IxZ6Q4s
         +YQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719396627; x=1720001427;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CODmxJ7WAi/9W5Zp49KBekEucUyPOe+eyV9ajXeTHL4=;
        b=f0U5gYo9wc4AGbMcI5puDMpmqaUq6tDxyfmwa/oyDAMCvp7JGtu4/sWemHs7F6rZFr
         6wS375ihBVsb3xUEuJfvOPaO6Lp4aTXuto5IWS9JPz36Tu22MBVa4L7QrYH/grPrJx/L
         bFFbPIG1ES3y36xNV1/AFWovXmkN5l9z8bFozfZpifctDpPp9uD3qwVkid6ZobJO7rPx
         MK5s6Hyx+80esEsGtMgKwyEgGztUVsoTrDIi7OOuXkf/PrJHP1SZsjLv95R9fv7rZVxH
         wgYyhqgn6SzR18jXZs/wSz/rQ+XDNgOuCwcpXUqUA1CDdRaAkLQLUagTPMAFMGDkJnFJ
         QC/A==
X-Forwarded-Encrypted: i=1; AJvYcCX0Tc/wrVkC8G1g9VACd9tF7sB6qNJtci4dle1KC1wqX95rRmmRn5vd+r0ThezsqH+izRIxfV2VBxuyv/ZTk3jNjNzD0nNMTJi+zMNVBA==
X-Gm-Message-State: AOJu0Yw0/opRvNMa/sok7IUYsdo31KzfbVF6rHYdWeMp+whcfwNRa5qR
	VPvdlYTbxCuH5RSVutmMK6CHQeS4J7taYalXYOgIJ9sp7v0bgMWlfq6J1nzqh7Zom9uJCnO6j4r
	VP8AhaXSdmgKROe4AnVKX4uncooXjgJ68kH7DEw==
X-Google-Smtp-Source: AGHT+IF3lbTV0RYBiE7R5YSmwxSMLcsLF95dsDrDNlAyhnScJgGvl/+e2exCY3OLJZIBn9r5xOXG/EzI6V9+H38zQ2A=
X-Received: by 2002:a19:f618:0:b0:52c:dba9:55ff with SMTP id
 2adb3069b0e04-52cdf15b006mr3296922e87.25.1719396626376; Wed, 26 Jun 2024
 03:10:26 -0700 (PDT)
MIME-Version: 1.0
References: <20240621093142.698529-1-potin.lai.pt@gmail.com>
In-Reply-To: <20240621093142.698529-1-potin.lai.pt@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 26 Jun 2024 12:10:15 +0200
Message-ID: <CACRpkdZ4+pJTSu+GZ=BSfY6G-3Pj=81275AMEewAvoDFpACYMw@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] add ast2600 NCSI pin groups
To: Potin Lai <potin.lai.pt@gmail.com>
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, linux-aspeed@lists.ozlabs.org, Patrick Williams <patrick@stwcx.xyz>, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Andrew Jeffery <andrew@codeconstruct.com.au>, Potin Lai <potin.lai@quantatw.com>, linux-arm-kernel@lists.infradead.org, Cosmo Chou <cosmo.chou@quantatw.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Fri, Jun 21, 2024 at 11:33=E2=80=AFAM Potin Lai <potin.lai.pt@gmail.com>=
 wrote:

> In the NCSI pin table, the reference clock output pin (RMIIXRCLKO) is not
> needed on the management controller side.

This v4 patch set applied!

Yours,
Linus Walleij
