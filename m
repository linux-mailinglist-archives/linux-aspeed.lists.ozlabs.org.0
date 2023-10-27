Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CD2FB7E7788
	for <lists+linux-aspeed@lfdr.de>; Fri, 10 Nov 2023 03:31:39 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=permerror header.d=linaro.org header.i=@linaro.org header.a=rsa-sha1 header.s=google header.b=RUFMqf6b;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SRNB15HPXz3bTn
	for <lists+linux-aspeed@lfdr.de>; Fri, 10 Nov 2023 13:31:37 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=RUFMqf6b;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::630; helo=mail-ej1-x630.google.com; envelope-from=dan.carpenter@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SGqg00f10z2y1l
	for <linux-aspeed@lists.ozlabs.org>; Fri, 27 Oct 2023 15:38:34 +1100 (AEDT)
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-9bdf5829000so261954966b.0
        for <linux-aspeed@lists.ozlabs.org>; Thu, 26 Oct 2023 21:38:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698381508; x=1698986308; darn=lists.ozlabs.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=frH4yJkEgXqgTfgCib1fGkByILTuSnogO/76sANZ2P8=;
        b=RUFMqf6bfeqkRqvcmdjN6dI7fGBRmZfG7W0t7we7kB2NXVpxcm6XBGusNFkARmKAcg
         P80vAWb45ODLFJ7Q+mrl2chLDmmCQMsJ1p+Z0F7EEaD2E81ASlbC6KbI6ljpOM71skrM
         ibAwBONruZa3uMpdzM/MkvjcwnJ+S2gvYizt8AvrxaVAAbYJBmIBlvjsHH3+vtPY3uyY
         y9fzwgblMCK1hGbxUwylLpoDcIGtPEMWx0HKwljxE092JdFDP8wSyHMXkAR6RE8x1zvW
         aSnv1cptFKxrHi1V7+uDajNyb4Qs+FuvunLQoWBPh25rhW0J6v7VwO9MEIr+rW1AXu1c
         sBlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698381508; x=1698986308;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=frH4yJkEgXqgTfgCib1fGkByILTuSnogO/76sANZ2P8=;
        b=G8hCmrGZmmJs1aSqN0uTFF06AZ10xmEphbNzVgDyQS2OXRJvl8cLS0JkIb2ELIjNda
         FGlomrr1OStngZYOmRFUStYK3Z/IqbPkr/eog+qxaKVuixeu/KihFP/vsCEM9F5Un1CA
         Lx6qnAs/enBf2wr4S5IuuNAOfCXERS43uxqylrok6Pp7Nbe+h+ezXhHm2NtstyRC6FHA
         0DwutQeGzpjpVblfh0OdExW+CbzNiFun+FitjgJc1YX35s0pFb3F1uBNXgxZBP526vrH
         FAtkLOBNvjjam6N0Bh7+CCTJhtrJuM/ytDLfdlehSqNgj/m0F1gcBbmGDvNRmRGrQJw6
         g+Mw==
X-Gm-Message-State: AOJu0YwGdgRgYp4OXwOOOSpzyzS+YS378g29iYEUB8Ce+Yls6pekd804
	MF0YbfsNpJfuImiEjn1UZ+4k0Q==
X-Google-Smtp-Source: AGHT+IGjJa1LbVHYTYwKBrD6xiKfLTzfmk9anQXCBhZgPDmOxIx1s+7SIDPmGxGpMNXP+CVvj5zJbA==
X-Received: by 2002:a17:907:7baa:b0:9be:705:d7d0 with SMTP id ne42-20020a1709077baa00b009be0705d7d0mr1427154ejc.0.1698381507653;
        Thu, 26 Oct 2023 21:38:27 -0700 (PDT)
Received: from localhost (h3221.n1.ips.mtn.co.ug. [41.210.178.33])
        by smtp.gmail.com with ESMTPSA id lf19-20020a170906ae5300b009ad89697c86sm556618ejb.144.2023.10.26.21.38.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Oct 2023 21:38:27 -0700 (PDT)
Date: Fri, 27 Oct 2023 07:38:19 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Su Hui <suhui@nfschina.com>
Subject: Re: [PATCH] soc: aspeed: lpc: Fix impossible judgment condition
Message-ID: <b0fb2821-42e2-40e1-88f4-0a697cdb2a97@kadam.mountain>
References: <20231027020703.1231875-1-suhui@nfschina.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231027020703.1231875-1-suhui@nfschina.com>
X-Mailman-Approved-At: Fri, 10 Nov 2023 13:24:54 +1100
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
Cc: robh@kernel.org, linux-aspeed@lists.ozlabs.org, arnd@arndb.de, gregkh@linuxfoundation.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, roblip@gmail.com, andrew@codeconstruct.com.au, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Fri, Oct 27, 2023 at 10:07:04AM +0800, Su Hui wrote:
> smatch error：
> drivers/soc/aspeed/aspeed-lpc-snoop.c:169
> aspeed_lpc_snoop_config_irq() warn: platform_get_irq() does not return zero
> 
> platform_get_irq() return non-zero IRQ number or negative error code,
> change '!lpc_snoop->irq' to 'lpc_snoop->irq < 0' to fix this.
> 
> Fixes: 9f4f9ae81d0a ("drivers/misc: add Aspeed LPC snoop driver")
> Signed-off-by: Su Hui <suhui@nfschina.com>

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter

