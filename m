Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB4A4554537
	for <lists+linux-aspeed@lfdr.de>; Wed, 22 Jun 2022 12:18:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LSfVZ4Ztzz3dqq
	for <lists+linux-aspeed@lfdr.de>; Wed, 22 Jun 2022 20:18:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=hgLMdhIM;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::534; helo=mail-ed1-x534.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=hgLMdhIM;
	dkim-atps=neutral
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LSfTS6Dytz3f2K
	for <linux-aspeed@lists.ozlabs.org>; Wed, 22 Jun 2022 20:17:48 +1000 (AEST)
Received: by mail-ed1-x534.google.com with SMTP id o9so13964290edt.12
        for <linux-aspeed@lists.ozlabs.org>; Wed, 22 Jun 2022 03:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sw2lC+m2hGDUwBL9IFA6pBssodKXCe1mWf619i6f5BQ=;
        b=hgLMdhIMgiUy+MoiXvHJ2RJ9Wa0i1ZtMh73G1txuIKpg2AaqgMOwrM9CZPZ/sxDHYZ
         IMgph9yXYODnsgCQbf4TNClb8Ig7RHB8cabwDRw4cDlk7Q3tjgmmj0W0xB/iLnHX9n9+
         Z8bXF7T8T9B2ZVaGBQh8R7pePDlE1Jsyt6uy3Cg43YaZMkrg22A4aqupR6A21O0xhUxe
         NfLmARQNCl5rZsME4DXIfs4bmbmy00RiWWWZa0lQ95N05AvVsE3cb9WiA8niad8+VBzU
         ZZYwXKW3uEtEr4BOYecqDjltS0jA1vLMCuh4PfAP28A+VWI6iJ3iH/8hwi7X/rmrneR6
         dZ8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sw2lC+m2hGDUwBL9IFA6pBssodKXCe1mWf619i6f5BQ=;
        b=HXfbccUp7Ak2nr6romy9QJlYI1mnKE0LPsfBCRFWtAhruwm9SJaluXoAcUZwBM0hLv
         /1KLRcqG3Br6pioMfsDBVNi2/E66ET+FzkIlQEORiofaWXbVQtbUFIbCU7MwaNouWO8p
         ce8wamgf45HUBKhsBZpVXsBkIgq+a+v95sqT6UQsv+15Wq+I5cD6a0Xw+OY+l5fnBFrY
         5wtMSehqcjLNedQp0wvfM487W3ratxQEioD5FsyDuO2MSU/9I6bLB6n4TzOeZ9Kjy/kD
         zb5iuaOurPXin5/te+cqMce3A75Yk/6/3ITdIIKLsZyVwNEE3Jna3H6T73XzYZ6oc557
         dZBA==
X-Gm-Message-State: AJIora+0lD6ye9wfic7zvTtNbQsr+Xe14P9TZve637RWS/5skt9b0LKO
	nNewurw+q8W0kgCsEDUhv+YugA==
X-Google-Smtp-Source: AGRyM1vibWYX9QDeWYNt9B5sInQlF+vF5g0R5kz55sooOwbcMXMh2vUXX0FF1o1QUF932CUm0pAP5g==
X-Received: by 2002:a05:6402:28a2:b0:435:798e:2988 with SMTP id eg34-20020a05640228a200b00435798e2988mr3220145edb.217.1655893065351;
        Wed, 22 Jun 2022 03:17:45 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id ky4-20020a170907778400b006fe921fcb2dsm9028707ejc.49.2022.06.22.03.17.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jun 2022 03:17:44 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: steven_lee@aspeedtech.com,
	linux-kernel@vger.kernel.org,
	andrew@aj.id.au,
	joel@jms.id.au,
	krzysztof.kozlowski@linaro.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	chen.kenyy@inventec.com,
	linux-aspeed@lists.ozlabs.org,
	robh+dt@kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	krzysztof.kozlowski+dt@linaro.org
Subject: Re: (subset) [PATCH 7/7] ARM: dts: aspeed: centriq2400: use qcom compatible
Date: Wed, 22 Jun 2022 12:17:39 +0200
Message-Id: <165589305701.29629.10216921074802952879.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220529104928.79636-7-krzysztof.kozlowski@linaro.org>
References: <20220529104928.79636-1-krzysztof.kozlowski@linaro.org> <20220529104928.79636-7-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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
Cc: David_Wang6097@jabil.com
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Sun, 29 May 2022 12:49:28 +0200, Krzysztof Kozlowski wrote:
> "qualcomm" is not a documented compatible and instead "qcom" should be
> used.
> 
> 

Applied, thanks!

[7/7] ARM: dts: aspeed: centriq2400: use qcom compatible
      https://git.kernel.org/krzk/linux/c/6202c6063145cf9ec22b40aac219122dd702a10f

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
